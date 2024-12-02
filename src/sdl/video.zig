const PixelFormat = @import("pixels.zig").PixelFormat;
const Surface = @import("surface.zig").Surface;
pub const SDL_Rect = extern struct {
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
};
pub const SDL_Point = extern struct {
    x: c_int,
    y: c_int,
};
const SystemTheme = enum {
    SYSTEM_THEME_UNKNOWN,
    SYSTEM_THEME_LIGHT,
    SYSTEM_THEME_DARK,
};

const DisplayModeData = anyopaque;
const WindowID = u32;
const DisplayID = u32;

const DisplayMode = extern struct {
    displayID: DisplayID,
    format: PixelFormat,
    w: c_int,
    h: c_int,
    pixel_density: f32,
    refresh_rate: f32,
    refresh_rate_denominator: c_int,
    refresh_rate_numerator: c_int,

    internal: *DisplayModeData,
};

const DisplayOrientation = enum {
    DISPLAY_ORIENTATION_UNKNOWN,
    DISPLAY_ORIENTATION_LANDSCAPE,
    DISPLAY_ORIENTATION_LANDSCAPE_FLIPPED,
    DISPLAY_ORIENTATION_PORTRAIT,
    DISPLAY_ORIENTATION_PORTRAIT_FLIPPED,
};

const Window = anyopaque;

const WindowFlags = enum(u64) {
    FULLSCREEN = 1,
    OPENGL = 2,
    OCCLUDED = 4,
    HIDDEN = 8,
    BORDERLESS = 16,
    RESIZABLE = 32,
    MINIMIZED = 64,
    MAXIMIZED = 128,
    MOUSE_GRABBED = 256,
    INPUT_FOCUS = 512,
    MOUSE_FOCUS = 1024,
    EXTERNAL = 2048,
    MODAL = 4096,
    HI_DPI = 8192,
    MOUSE_CAPTURE = 16384,
    MOUSE_RELATIVE_MODE = 32768,
    ALWAYS_ON_TOP = 65536,
    UTILITY = 131072,
    TOOLTIP = 262144,
    POPUP_MENU = 524288,
    KEYBOARD_GRABBED = 1048576,
    VULKAN = 268435456,
    METAL = 536870912,
    TRANSPARENT = 1073741824,
    NOT_FOCUSABLE = 2147483648,
};

// TODO: add SDL_WINDOWS_POS stuff

const FlashOperation = enum {
    FLASH_CANCEL,
    FLASH_BRIEFLY,
    FLASH_UNTIL_FOCUSED,
};

const GLContextState = *anyopaque;

const EGLDisplay = *void;
const EGLConfig = *void;
const EGLSurface = *void;
const EGLAttrib = *c_int;
const EGLint = c_int;
const EGLAttribArrayCallback = fn (userdata: ?*anyopaque) ?*EGLAttrib;
const EGLIntArrayCallback = fn (userdata: ?*anyopaque, display: EGLDisplay, config: EGLConfig) ?*EGLint;

const GLAttr = enum {
    RED_SIZE,
    GREEN_SIZE,
    BLUE_SIZE,
    ALPHA_SIZE,
    BUFFER_SIZE,
    DOUBLEBUFFER,
    DEPTH_SIZE,
    STENCIL_SIZE,
    ACCUM_RED_SIZE,
    ACCUM_GREEN_SIZE,
    ACCUM_BLUE_SIZE,
    ACCUM_ALPHA_SIZE,
    STEREO,
    MULTISAMPLEBUFFERS,
    MULTISAMPLESAMPLES,
    RETAINED_BACKING,
    CONTEXT_MAJOR_VERSION,
    CONTEXT_MINOR_VERSION,
    CONTEXT_FLAGS,
    CONTEXT_PROFILE_MASK,
    SHARE_WITH_CURRENT_CONTEXT,
    FRAMEBUFFER_SRGB_CAPABLE,
    CONTEXT_RELEASE_BEHAVIOR,
    CONTEXT_RESET_NOTIFICATION,
    CONTEXT_NO_ERROR,
    FLOAT_BUFFERS,
    EGL_PLATFORM,
};
const GLProfile = enum(u32) {
    CORE,
    COMPATIBILITY,
    ES,
};

const GLContextFlags = enum(u32) {
    DEBUG = 1,
    FORWARD_COMPATIBLE = 2,
    ROBUST_ACCESS = 4,
    RESET_ISOLATION = 8,
};

const GLContextReleaseBehavior = enum(u32) {
    NONE,
    FLUSH,
};

const GLContextResetNotification = enum(u32) {
    NONE,
    LOSE_CONTEXT,
};

pub extern "SDL3" fn SDL_GetNumVideoDrivers() callconv(.C) c_int;
pub extern "SDL3" fn SDL_GetVideoDriver(index: c_int) callconv(.C) [*c]const u8;
pub extern "SDL3" fn SDL_GetCurrentVideoDriver() callconv(.C) [*c]const u8;
pub extern "SDL3" fn SDL_GetSystemTheme() callconv(.C) SystemTheme;
pub extern "SDL3" fn SDL_GetDisplays(count: [*c]c_int) callconv(.C) [*c]DisplayID;
pub extern "SDL3" fn SDL_GetPrimaryDisplay() callconv(.C) DisplayID;
pub extern "SDL3" fn SDL_GetDisplayProperties(displayID: DisplayID) callconv(.C) u32;
pub extern "SDL3" fn SDL_GetDisplayName(id: DisplayID) callconv(.C) [*c]const u8;
pub extern "SDL3" fn SDL_GetDisplayBounds(id: DisplayID, rect: *SDL_Rect) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetDisplayUsableBounds(id: DisplayID, rect: *SDL_Rect) callconv(.C) bool;
pub extern "SDL3" fn SDL_GerNaturalDisplayOrientation(displayID: DisplayID) callconv(.C) DisplayOrientation;
pub extern "SDL3" fn SDL_GetCurrentDisplayOrientation(displayID: DisplayID) callconv(.C) DisplayOrientation;
pub extern "SDL3" fn SDL_GetDisplayContentScale(displayID: DisplayID) callconv(.C) f32;
pub extern "SDL3" fn SDL_GetFullscreenDisplayModes(displayID: DisplayID, count: [*c]c_int) callconv(.C) [*c][*c]DisplayMode;
pub extern "SDL3" fn SDL_GetClosestFullscreenDisplayMode(displayID: DisplayID, width: c_int, height: c_int, refreshRate: f32, include_high_density_modes: bool, display_mode: [*c]DisplayMode) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetDesktopDisplayMode(displayID: DisplayID) callconv(.C) [*c]DisplayMode;
pub extern "SDL3" fn SDL_GetCurrentDisplayMode(displayID: DisplayID) callconv(.C) [*c]DisplayMode;
pub extern "SDL3" fn SDL_GetDisplayForPoint(point: *SDL_Point) callconv(.C) DisplayID;
pub extern "SDL3" fn SDL_GetDisplayForRect(rect: *SDL_Rect) callconv(.C) DisplayID;
pub extern "SDL3" fn SDL_GetDisplayForWindow(window: *Window) callconv(.C) DisplayID;
pub extern "SDL3" fn SDL_GetWindowPixelDensity(window: *Window) callconv(.C) f32;
pub extern "SDL3" fn SDL_GetWindowDisplayScale(window: *Window) callconv(.C) f32;
pub extern "SDL3" fn SDL_SetWindowFullscreenMode(window: *Window, mode: *DisplayMode) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowFullscreenMode(window: *Window) callconv(.C) [*c]DisplayMode;
pub extern "SDL3" fn SDL_GetWindowICCProfile(window: *Window, size: *isize) callconv(.C) *anyopaque;
pub extern "SDL3" fn SDL_GetWindowPixelFormat(window: *Window) callconv(.C) PixelFormat;
pub extern "SDL3" fn SDL_GetWindows(count: *c_int) callconv(.C) [*c][*c]Window;
pub extern "SDL3" fn SDL_CreateWindow(title: [*c]const u8, w: c_int, h: c_int, flags: WindowFlags) callconv(.C) [*c]Window;
pub extern "SDL3" fn SDL_CreatePopupWindow(parent: *Window, offset_x: c_int, offset_y: c_int, w: c_int, h: c_int, flags: WindowFlags) callconv(.C) [*c]Window;
pub extern "SDL3" fn SDL_CreateWindowWithProperties(props: u32) callconv(.C) [*c]Window;
pub extern "SDL3" fn SDL_GetWindowID(window: *Window) callconv(.C) WindowID;
pub extern "SDL3" fn SDL_GetWindowFromID(id: WindowID) callconv(.C) *Window;
pub extern "SDL3" fn SDL_GetWindowParent(window: *Window) callconv(.C) *Window;
pub extern "SDL3" fn SDL_GetWindowProperties(window: *Window) callconv(.C) u32;
pub extern "SDL3" fn SDL_GetWindowFlags(window: *Window) callconv(.C) WindowFlags;
pub extern "SDL3" fn SDL_SetWindowTitle(window: *Window, title: [*c]const u8) callconv(.C) void;
pub extern "SDL3" fn SDL_GetWindowTitle(window: *Window) callconv(.C) [*c]const u8;
pub extern "SDL3" fn SDL_SetWindowIcon(window: *Window, icon: *Surface) callconv(.C) void;
pub extern "SDL3" fn SDL_SetWindowPosition(window: *Window, x: c_int, y: c_int) callconv(.C) void;
pub extern "SDL3" fn SDL_GetWindowPosition(window: *Window, x: *c_int, y: *c_int) callconv(.C) void;
pub extern "SDL3" fn SDL_SetWindowSize(window: *Window, w: c_int, h: c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowSize(window: *Window, w: *c_int, h: *c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowSafeArea(window: *Window, rect: *SDL_Rect) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowAspectRatio(window: *Window, min_aspect: f32, max_aspect: f32) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowAspectRatio(window: *Window, min_aspect: *f32, max_aspect: *f32) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowBordersSize(window: *Window, top: *c_int, left: *c_int, bottom: *c_int, right: *c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowSizeInPixels(window: *Window, w: *c_int, h: *c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowMinimumSize(window: *Window, min_w: c_int, min_h: c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowMinimumSize(window: *Window, w: *c_int, h: *c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowMaximumSize(window: *Window, max_w: c_int, max_h: c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowMaximumSize(window: *Window, w: *c_int, h: *c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowBordered(window: *Window, bordered: bool) callconv(.C) void;
pub extern "SDL3" fn SDL_SetWindowResizable(window: *Window, resizable: bool) callconv(.C) void;
pub extern "SDL3" fn SDL_SetWindowAlwaysOnTop(window: *Window, on_top: bool) callconv(.C) void;
pub extern "SDL3" fn SDL_ShowWindow(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_HideWindow(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_RaiseWindow(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_MaximizeWindow(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_MinimizeWindow(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_RestoreWindow(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowFullscreen(window: *Window, fullscreen: bool) callconv(.C) bool;
pub extern "SDL3" fn SDL_SyncWindow(window: *Window) callconv(.C) void;
pub extern "SDL3" fn SDL_WindowHasSurface(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowSurface(window: *Window) callconv(.C) [*c]Surface;
pub extern "SDL3" fn SDL_SetWindowSurfaceVSync(window: *Window, vsync: c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowSurfaceVSync(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_UpdateWindowSurface(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_UpdateWindowSurfaceRects(window: *Window, rects: [*c]SDL_Rect, numrects: c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_DestroyWindowSurface(window: *Window) callconv(.C) void;
pub extern "SDL3" fn SDL_SetWindowKeyboardGrab(window: *Window, grabbed: bool) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowMouseGrab(window: *Window, grabbed: bool) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowKeyboardGrab(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowMouseGrab(window: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetGrabbedWindow() callconv(.C) *Window;
pub extern "SDL3" fn SDL_SetWindowMouseRect(window: *Window, rect: *SDL_Rect) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowMouseRect(window: *Window) callconv(.C) *SDL_Rect;
pub extern "SDL3" fn SDL_SetWindowOpacity(window: *Window, opacity: f32) callconv(.C) bool;
pub extern "SDL3" fn SDL_GetWindowOpacity(window: *Window) callconv(.C) f32;
pub extern "SDL3" fn SDL_SetWindowParent(window: *Window, parent: *Window) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowModal(window: *Window, modal: bool) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowFocusable(window: *Window, focusable: bool) callconv(.C) bool;
pub extern "SDL3" fn SDL_ShowWindowSystemMenu(window: *Window, x: c_int, y: c_int) callconv(.C) bool;
const HitTestResult = enum {
    NORMAL,
    DRAGGABLE,
    RESIZE_TOPLEFT,
    RESIZE_TOP,
    RESIZE_TOPRIGHT,
    RESIZE_RIGHT,
    RESIZE_BOTTOMRIGHT,
    RESIZE_BOTTOM,
    RESIZE_BOTTOMLEFT,
    RESIZE_LEFT,
};
const HitTest = fn (win: ?*Window, area: ?*const SDL_Point, data: ?*anyopaque) HitTestResult;

pub extern "SDL3" fn SDL_SetWindowHitTest(window: *Window, callback: ?HitTest, callback_data: ?*anyopaque) callconv(.C) bool;
pub extern "SDL3" fn SDL_SetWindowShape(window: *Window, shape: *Surface) callconv(.C) bool;
pub extern "SDL3" fn SDL_FlashWindow(window: *Window, operation: FlashOperation) callconv(.C) bool;
pub extern "SDL3" fn SDL_DestroyWindow(window: *Window) callconv(.C) void;
pub extern "SDL3" fn SDL_ScreenSaverEnabled() callconv(.C) bool;
pub extern "SDL3" fn SDL_EnableScreenSaver() callconv(.C) bool;
pub extern "SDL3" fn SDL_DisableScreenSaver() callconv(.C) bool;
pub extern "SDL3" fn SDL_GL_LoadLibrary(path: [*c]const u8) callconv(.C) bool;
pub extern "SDL3" fn SDL_GL_GetProcAddress(proc: [*c]const u8) callconv(.C) ?*anyopaque;
pub extern "SDL3" fn SDL_EGL_GetProcAddress(proc: [*c]const u8) callconv(.C) ?*anyopaque;
pub extern "SDL3" fn SDL_GL_UnloadLibrary() callconv(.C) void;
pub extern "SDL3" fn SDL_GL_ExtensionSupported(extension: [*c]const u8) callconv(.C) bool;
pub extern "SDL3" fn SDL_GL_ResetAttributes() callconv(.C) void;
pub extern "SDL3" fn SDL_GL_SetAttribute(attr: GLAttr, value: c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GL_GetAttribute(attr: GLAttr, value: *c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GL_CreateContext(window: *Window) callconv(.C) ?*anyopaque;
pub extern "SDL3" fn SDL_GL_MakeCurrent(window: *Window, context: ?*anyopaque) callconv(.C) bool;
pub extern "SDL3" fn SDL_GL_GetCurrentWindow() callconv(.C) *Window;
pub extern "SDL3" fn SDL_GL_GetCurrentContext() callconv(.C) GLContextState;
pub extern "SDL3" fn SDL_EGL_GetCurrentDisplay() callconv(.C) EGLDisplay;
pub extern "SDL3" fn SDL_EGL_GetCurrentConfig() callconv(.C) EGLConfig;
pub extern "SDL3" fn SDL_EGL_GetWindowSurface(window: *Window) callconv(.C) EGLSurface;
pub extern "SDL3" fn SDL_EGL_SetAttributeCallbacks(platformAttribCallback: EGLAttribArrayCallback, surfaceAttribCallback: EGLIntArrayCallback, contextAttribCallback: EGLIntArrayCallback, userdata: ?*anyopaque) callconv(.C) void;
pub extern "SDL3" fn SDL_GL_SetSwapInterval(interval: c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GL_GetSwapInterval(interval: *c_int) callconv(.C) bool;
pub extern "SDL3" fn SDL_GL_SwapWindow(window: *Window) callconv(.C) void;
pub extern "SDL3" fn SDL_GL_DestroyContext(context: ?*anyopaque) callconv(.C) void;
