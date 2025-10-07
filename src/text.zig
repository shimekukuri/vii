const conversion = @import("conversion.zig");
const VectorAlignedSlice = conversion.VectorAlignedSlice;

///Used To find the index in which an element exists and or starts at IE for string slices in specific find the index
///of the first Char
pub inline fn findIndex(comptime T: type, source: VectorAlignedSlice(T), target: VectorAlignedSlice(T)) usize {
    _ = source;
    return 0;
}

pub inline fn rotateSliceGen(comptime T: typei, ) {

}
