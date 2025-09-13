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
