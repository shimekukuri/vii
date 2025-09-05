//! This module provides functionality for casting to and from vector types

///Given N where is the size of the vector and T, the type that occupies the vector r
pub inline fn vecAsSlice(comptime N: usize, comptime T: type, vec: *@Vector(N, T)) *const [N]T {
    return @as(*const [N]u8, @ptrCast(vec));
}

pub inline fn sliceAsVec(comptime N: usize, comptime T: type, slice: []T) *@Vector(N, T) {
    return @ptrCast(@alignCast(slice));
}
