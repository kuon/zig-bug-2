const std = @import("std");
const Pkg = std.build.Pkg;

const microzig = @import("libs/microzig/build.zig");

pub const stm32l011f3px = microzig.Chip{
    .name = "STM32L0x1",
    .source = .{
        .path = root() ++ "src/registers.zig",
    },
    .cpu = microzig.cpus.cortex_m0plus,
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x08000000, .length = 8 * 1024 },
        .{ .kind = .ram, .offset = 0x20000000, .length = 2 * 1024 },
    },
};

pub fn build(b: *std.build.Builder) void {
    const optimize = b.standardOptimizeOption(.{
        .preferred_optimize_mode = .ReleaseFast,
    });
    var exe = microzig.addEmbeddedExecutable(b, .{
        .name = "bug2",
        .source_file = .{ .path = "src/main.zig" },
        .optimize = optimize,
        .backing = .{ .chip = stm32l011f3px },
    });

    exe.inner.want_lto = false;

    exe.installArtifact(b);

    var exe2 = microzig.addEmbeddedExecutable(b, .{
        .name = "bug2-2",
        .source_file = .{ .path = "src/main2.zig" },
        .optimize = optimize,
        .backing = .{ .chip = stm32l011f3px },
    });

    exe2.installArtifact(b);
}

fn root() []const u8 {
    return comptime (std.fs.path.dirname(@src().file) orelse unreachable) ++ "/";
}
