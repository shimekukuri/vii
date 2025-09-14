//!This module provides functionality for working with memory operations in the context of simd. These are either
//!functions that exist in the standard library adapted to work with other functionality within this library or general
//!utility functions that are avialbe to use. IE default implimentations for aligned Allocations

const std = @import("std");

const mem = std.mem;
const Allocator = mem.Allocator;
const Alignment = mem.Alignment;
const alignforward = mem.alignForward;

const simd = std.simd;
const suggestVectorLength = simd.suggestVectorLength;

pub fn autoAlignAlloc(comptime T: type, size: usize) !void {
    const aligned_size = alignforward(T, size, suggestVectorLength(T) orelse 1);
    //come back here and finish
}
