//! This module provides functionality for casting to and from vector types
const std = @import("std");
const testing = std.testing;
const suggestVectorLength = std.simd.suggestVectorLength;

///For casting from a Vec to a slice of given T where T is aligned to alignement of @alignOf(@Vector(suggestVectorLength(T) orelse 1, T)).
///Usually used in with sliceAsVec to easily move back and forth between the two types while operating on the same backing data.
///The vector length is automatically Selected as by std.simd.suggestVectorLength It is recomended that you use whatever length
///is generated from suggestVectorLength as it is going to be targeting whatever cpu features are available at compile time, and
///the flags that were passed into the build command.
pub inline fn vecAsSlice(comptime T: type, vec: *@Vector(suggestVectorLength(T) orelse 1, T)) *const [suggestVectorLength(T) orelse 1]T {
    return @ptrCast(vec);
}

///For castin from a slice to a Vec of given T. Usually used in with vecAsSlice to easily move back and forth between
///the two types while operating on the same backing data. The vector length is automatically Selected as by std.simd.suggestVectorLength
///It is recomended that you use whatever length is generated from suggestVectorLength as it is going to be targeting
///whatever cpu features are available at compile time, and the flags that were passed into the build command.
pub inline fn sliceAsVec(comptime T: type, slice: VectorAlignedSlice(T)) *@Vector(suggestVectorLength(T) orelse 1, T) {
    return @ptrCast(@alignCast(slice));
}

test "sliceAsVecSuceeds" {
    var exampleArr align(@alignOf(@Vector(suggestVectorLength(u8) orelse 1, u8))) = [_]u8{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3 };
    const exampleSlice = exampleArr[0..];
    const x = sliceAsVec(u8, exampleSlice);
    try testing.expect(@TypeOf(x) == *@Vector(suggestVectorLength(u8) orelse 1, u8));
}

///Given T Describes a slice that's alignment matches that of it's vectors counterpart based upon available CPU features
pub inline fn VectorAlignedSlice(comptime T: type) type {
    const vector_len = suggestVectorLength(T) orelse 1;
    const VectorType = @Vector(vector_len, T);
    const alignment = @alignOf(VectorType);
    return []align(alignment) T;
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
