const conversion = @import("conversion.zig");
const VectorAlignedSlice = conversion.VectorAlignedSlice;

pub inline fn findIndex(comptime T: type, slice: VectorAlignedSlice(T)) usize {
    _ = slice;
    return 0;
}
