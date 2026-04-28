//! Core utility
//! 4/28/2026 - Nyx

pub const Ord = enum(u3) {
    const L = 0b001;
    const Eq = 0b010;
    const G = 0b100;

    const Le = 0b011;
    const Ge = 0b110;
    const Ne = 0b101;

    const Nu = 0b000;

    l = L,
    eq = Eq,
    g = G,
    le = Le,
    ge = Ge,
    ne = Ne,
    nu = Nu,

    pub fn i(self: Ord) u3 {
        return @intFromEnum(self);
    }
};