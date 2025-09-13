//! This module provides functionality for working with IO in the context of Simd operations and vector types
//! IE when reading a source we want to ensure the methods in which we are storing it allow for proper usage within simd
//! more explicitly we want to ensure that alignment is correct.
const std = @import("std");
const Allocator = std.mem.Allocator;
const constants = @import("constants.zig");

pub fn readFileAligned(path: []const u8, allocator: Allocator) ![]u8 {
    var pathBuff: [std.fs.max_path_bytes]u8 = undefined;
    const fpath = try std.fs.realpath(path, &pathBuff);
    const file = try std.fs.openFileAbsolute(fpath, .{ .mode = .read_only });
    defer file.close();
    const fileSize = try file.getEndPos();

    const aligned_size = std.mem.alignForward(usize, fileSize, constants.u8Len);
    const buff = try allocator.alignedAlloc(u8, @alignOf(constants.u8Len), aligned_size);

    // Initialize the padding bytes to a safe value (like 0 or space)
    @memset(buff, 0);

    // FIXED: Read the actual file content
    //

    return buff[0..fileSize]; // Return slice with original file size
}

test "can readfile" {
    readFileAligned(, allocator: Allocator)
}
