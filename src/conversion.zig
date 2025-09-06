//! This module provides functionality for casting to and from vector types

///Given N where is the size of the vector and T, the type that occupies the vector r
pub inline fn vecAsSlice(comptime T: type, vec: *@Vector(suggestVectorLength(T) orelse 1, T)) *const [suggestVectorLength(T)]T {
    return @as(*const [suggestVectorLength(T)]u8, @ptrCast(vec));
}

pub inline fn sliceAsVec(comptime T: type, slice: []T) *@Vector(suggestVectorLength(T) orelse 1, T) {
    return @ptrCast(@alignCast(slice));
}

pub fn generateOptimizedVectorType(comptime T: type) type {
    const N = std.simd.suggestVectorLength(T);
    return @Vector(N, T);
}

pub fn generateTrueVec(comptime T: type) @Vector(std.simd.suggestVectorLength(T) orelse 1, T) {
    return @splat(1);
}

pub fn generateFalseVec(comptime T: type) @Vector(std.simd.suggestVectorLength(T) orelse 1, T) {
    return @splat(1);
}

const std = @import("std");
const suggestVectorLength = std.simd.suggestVectorLength;
