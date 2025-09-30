//! This module provides functionality for working with IO in the context of Simd operations and vector types
//! IE when reading a source we want to ensure that we  are storing it allow for proper usage with simd
//! more explicitly we want to ensure that alignment is correct.
const std = @import("std");
const constants = @import("constants.zig");
const testing = std.testing;

const mem = std.mem;
const Allocator = mem.Allocator;
const Alignment = mem.Alignment;
const eql = mem.eql;
const alignForward = mem.alignForward;

const fs = std.fs;
const max_path_bytes = fs.max_path_bytes;
const realpath = fs.realpath;
const openFileAbsolute = fs.openFileAbsolute;

const simd = std.simd;
const suggestVectorLength = simd.suggestVectorLength;

const conversions = @import("conversion.zig");
const optimizeVectorType = conversions.optimizedVectorType;
const VectorAlignedSlice = conversions.VectorAlignedSlice;

///Reads from a file into a buffer optimally aligned for working with simd. Given your Cpu features the buffer is padded
///to the end of the next aligned address. Returned buffer is head allocated and needs to be freed.
pub fn alignedReadFile(path: []const u8, allocator: Allocator) !VectorAlignedSlice(u8) {
    var pathBuff: [max_path_bytes]u8 = undefined;
    const fpath = try realpath(path, &pathBuff);
    const file = try openFileAbsolute(fpath, .{ .mode = .read_only });
    defer file.close();
    const fileSize = try file.getEndPos();

    const aligned_size = alignForward(usize, fileSize, suggestVectorLength(u8).?);
    const buff = try allocator.alignedAlloc(u8, Alignment.of(optimizeVectorType(u8)), aligned_size);
    @memset(buff, 0);

    _ = try file.readAll(buff);

    return buff;
}

test "alignReadFileAddsPadding" {
    const testingData = "This is a test";
    const x = try alignedReadFile("./src/testFiles/alignReadFileAddsPadding", testing.allocator);
    defer testing.allocator.free(x);
    try testing.expect(!eql(u8, testingData[(testingData.len - 1)..], x[(x.len - 1)..]));
}
