const microzig = @import("microzig");
const regs = microzig.chip.peripherals;

pub fn main() !void {
    var addr = @ptrToInt(&regs.AES.CR.raw);
    _ = addr;
}
