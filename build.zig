const std = @import("std");
const Pkg = std.build.Pkg;


pub fn build(b: *std.build.Builder) void {
    const optimize = b.standardOptimizeOption(.{
        .preferred_optimize_mode = .ReleaseFast,
    });

    var exe = b.addExecutable(.{
        .name = "bug2",
        .root_source_file = .{ .path = "src/main.zig" },
        .optimize = optimize,
    });

    exe.want_lto = false;

    b.installArtifact(exe);
}
