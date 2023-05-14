pub fn main() !void {
    var int_values: [5]u32 = .{0} ** 5;
    var rx: [21]u8 = .{0} ** 21;

    @memcpy(@ptrCast([*]u8, &int_values), rx[1..]);
}

