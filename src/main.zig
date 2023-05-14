const microzig = @import("microzig");
const regs = microzig.chip.peripherals;

pub fn main() !void {
    var addr = @ptrToInt(&regs.SPI1.DR.raw);
    _ = addr;
}
