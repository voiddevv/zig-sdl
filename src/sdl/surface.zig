const PixelFormat = @import("pixels.zig").PixelFormat;
pub const SurfaceFlags = enum(u32) {
    PREALLOCATED = 0x00000001,
    LOCK_NEEDED = 0x00000002,
    LOCKED = 0x00000004,
    SIMD_ALIGNED = 0x00000008,
};
pub const ScaleMode = enum {
    NEAREST,
    LINEAR,
};
pub const FlipMode = enum {
    NONE,
    HORIZONTAL,
    VERTICAL,
};

pub const Surface = extern struct {
    flags: SurfaceFlags,
    format: PixelFormat,
    w: c_int,
    h: c_int,
    pitch: c_int,
    pixels: ?*anyopaque,
    refcount: c_int,
    reserved: *anyopaque,
};
// TODO add functions for Surface
