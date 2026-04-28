//! Registers
//! 4/28/2026 - Nyx

// INCLUDES -----
const std = @import("std");
const Ord = @import("../core.zig").Ord;

pub fn Register(comptime size: usize) type {
    if (size != 1 and size != 2 and size != 4 and size != 8 and size != 16) 
        @compileError("Registers can only be 1, 2, 4, 8, or 16 bytes in size");

    return extern union {
        const Self = @This();

        raw: [size]u8,

        // 8 bit
        i8: i8,
        u8: u8,
        bool: bool,
        ord: Ord,

        // 16 bit
        i16: if (size >= 2) i16 else void,
        u16: if (size >= 2) u16 else void,

        // 32 bit
        i32: if (size >= 4) i32 else void,
        u32: if (size >= 4) u32 else void,
        f32: if (size >= 4) f32 else void,

        // 64 bit
        i64: if (size >= 8) i64 else void,
        u64: if (size >= 8) u64 else void,
        f64: if (size >= 8) f64 else void,

        // 128 bit
        i128: if (size >= 16) i128 else void,
        u128: if (size >= 16) u128 else void,
        f128: if (size >= 16) f128 else void,

        pub fn empty() Self {
            return .{ .raw = [_]u8{0} ** size };
        }

        pub fn flush(self: *Self) void {
            self.raw = [_]u8{0} ** size;
        }

        pub fn copy(
            self: *Self, 
            comptime other_size: usize, 
            other: Register(other_size)
        ) void {
            const copy_size: usize = @min(size, other_size);
            @memmove(self.raw[0..copy_size], other.raw[0..copy_size]);
        }
    };
}
