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

const conversions = @import("conversion.zig");
const optimizeVectorType = conversions.optimizedVectorType;
const VectorAlignedSlice = conversions.VectorAlignedSlice;

pub fn alignedReadFile(path: []const u8, allocator: std.mem.Allocator) !VectorAlignedSlice(u8) {
    var pathBuff: [std.fs.max_path_bytes]u8 = undefined;
    const fpath = try std.fs.realpath(path, &pathBuff);
    const file = try std.fs.openFileAbsolute(fpath, .{ .mode = .read_only });
    defer file.close();
    const fileSize = try file.getEndPos();

    const aligned_size = std.mem.alignForward(usize, fileSize, std.simd.suggestVectorLength(u8).?);
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
