const std = @import("std");
const assert = std.debug.assert;

pub fn Mmio(comptime PackedT: type) type {
    const size = @bitSizeOf(PackedT);
    const IntT = std.meta.Int(.unsigned, size);
    return extern struct {
        const Self = @This();

        raw: IntT,

        pub const underlying_type = PackedT;
    };
}

pub const devices = struct {
    pub const AES = @intToPtr(*volatile types.AES, 0x40026000);
};

pub const types = struct {
    ///  Advanced encryption standard hardware accelerator
    pub const AES = extern struct {
        ///  control register
        CR: Mmio(packed struct(u32) {
            EN: u1,
            padding: u31,
        }),
    };
};

pub fn main() !void {
    var addr = @ptrToInt(&devices.AES.CR.raw);
    _ = addr;
}
