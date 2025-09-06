//! This module provides functionality for casting to and from vector types
const std = @import("std");
const suggestVectorLength = std.simd.suggestVectorLength;

///For castin from a Vec to a slice of given T. Usually used in with sliceAsVec to easily move back and forth between
///the two types while operating on the same backing data. The vector length is automatically Selected as by std.simd.suggestVectorLength
///It is recomended that you use whatever length is generated from suggestVectorLength as it is going to be targeting
///whatever cpu features are available at compile time, and the flags that were passed into the build command.
pub inline fn vecAsSlice(comptime T: type, vec: *@Vector(suggestVectorLength(T) orelse 1, T)) *const [suggestVectorLength(T) orelse 1]T {
    return @ptrCast(vec);
}

test "vecAsSliceSucceeds" {}

///For castin from a slice to a Vec of given T. Usually used in with vecAsSlice to easily move back and forth between
///the two types while operating on the same backing data. The vector length is automatically Selected as by std.simd.suggestVectorLength
///It is recomended that you use whatever length is generated from suggestVectorLength as it is going to be targeting
///whatever cpu features are available at compile time, and the flags that were passed into the build command.
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
