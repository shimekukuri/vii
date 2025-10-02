const std = @import("std");
const testing = std.testing;
const suggestVectorLength = std.simd.suggestVectorLength;

pub const u8Len = suggestVectorLength(u8).?;
pub const u16Len = suggestVectorLength(u16).?;
pub const u32Len = suggestVectorLength(u32).?;
pub const u64Len = suggestVectorLength(u64).?;

pub const i8Len = suggestVectorLength(i8).?;
pub const i16Len = suggestVectorLength(i16).?;
pub const i32Len = suggestVectorLength(i32).?;
pub const i64Len = suggestVectorLength(i64).?;

pub const BoolFalseVec8Bit: @Vector(u8Len, bool) = @splat(false);
pub const BoolTrueVec8Bit: @Vector(u8Len, bool) = @splat(true);

pub const BoolFalseVec16Bit: @Vector(u16Len, bool) = @splat(false);
pub const BoolTrueVec16Bit: @Vector(u16Len, bool) = @splat(true);

pub const BoolFalseVec32Bit: @Vector(u32Len, bool) = @splat(false);
pub const BoolTrueVec32Bit: @Vector(u32Len, bool) = @splat(true);

pub const BoolFalseVec64Bit: @Vector(u64Len, bool) = @splat(false);
pub const BoolTrueVec64Bit: @Vector(u64Len, bool) = @splat(true);

pub const zeroVec8Bit: @Vector(u8Len, u8) = @splat(0);
pub const oneVec8Bit: @Vector(u8Len, u8) = @splat(1);

pub const zeroVec16Bit: @Vector(u16Len, u16) = @splat(0);
pub const oneVec16Bit: @Vector(u16Len, u16) = @splat(1);

pub const zeroVec32Bit: @Vector(u32Len, u32) = @splat(0);
pub const oneVec32Bit: @Vector(u32Len, u32) = @splat(1);

pub const zeroVec64Bit: @Vector(u64Len, u64) = @splat(0);
pub const oneVec64Bit: @Vector(u64Len, u64) = @splat(1);
