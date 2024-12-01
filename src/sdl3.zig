pub const SDL_Window = *anyopaque;
pub const SDL_Renderer = *void;
pub const SDL_CommonEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
};
pub const SDL_DisplayEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    displayID: u32,
    data1: i32,
    data2: i32,
};
pub const SDL_WindowEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    event: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    data1: i32,
    data2: i32,
};
pub const SDL_KeyboardDeviceEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
};
pub const SDL_KeyboardEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    state: u8,
    repeat: u8,
    padding2: u8,
    padding3: u8,
    keysym: u32,
};
pub const SDL_TextEditingEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    text: [*c]u8,
    start: i32,
    length: i32,
};
pub const SDL_TextEditingCandidatesEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    candidates: [*c]u8,
    candidates_len: i32,
    cursor: i32,
    selection_start: i32,
    selection_length: i32,
};
pub const SDL_TextInputEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    text: [*c]u8,
};
pub const SDL_MouseDeviceEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
};
pub const SDL_MouseMotionEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    which: u32,
    state: u32,
    x: i32,
    y: i32,
    xrel: i32,
    yrel: i32,
};
pub const SDL_MouseButtonEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    which: u32,
    button: u8,
    state: u8,
    clicks: u8,
    padding1: u8,
    x: i32,
    y: i32,
};
pub const SDL_MouseWheelEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    which: u32,
    x: f32,
    y: f32,
    direction: u32,
    padding1: u32,
    padding2: u32,
};
pub const SDL_JoyDeviceEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
};
pub const SDL_JoyAxisEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    axis: u8,
    value: i16,
    padding1: u16,
    padding2: u32,
};
pub const SDL_JoyBallEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    ball: u8,
    padding1: u8,
    padding2: u16,
    xrel: i16,
    yrel: i16,
};
pub const SDL_JoyHatEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    hat: u8,
    value: u8,
    padding1: u16,
    padding2: u32,
};
pub const SDL_JoyButtonEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    button: u8,
    state: u8,
    padding1: u8,
    padding2: u8,
};
pub const SDL_JoyBatteryEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    battery: u8,
    state: u8,
    percentage: u8,
    padding1: u8,
};
pub const SDL_GamepadDeviceEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
};
pub const SDL_GamepadAxisEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    axis: u8,
    value: i16,
    padding1: u16,
    padding2: u32,
};
pub const SDL_GamepadButtonEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    button: u8,
    state: u8,
    padding1: u8,
    padding2: u8,
};
pub const SDL_GamepadTouchpadEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    touchpad: u8,
    finger: u8,
    x: f32,
    y: f32,
    pressure: f32,
};
pub const SDL_GamepadSensorEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    sensor: u8,
    data: [3]f32,
};
pub const SDL_AudioDeviceEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    iscapture: u8,
    padding1: u8,
    padding2: u16,
    padding3: u32,
};
pub const SDL_TouchDeviceEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    touchID: i64,
    fingerID: i64,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
    windowID: u32,
};
pub const SDL_TouchMotionEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    touchID: i64,
    fingerID: i64,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
};
pub const SDL_CameraDeviceEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    cameraID: i32,
};
pub const SDL_SensorEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    which: i32,
    data: [6]f32,
};
pub const SDL_QuitEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
};
pub const SDL_UserEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    code: i32,
    data1: ?*anyopaque,
    data2: ?*anyopaque,
};
pub const SDL_SysWMEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    msg: ?*anyopaque,
};
pub const SDL_TouchFingerEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    touchID: i64,
    fingerID: i64,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
    windowID: u32,
};
pub const SDL_PenProximityEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    penID: i64,
    x: f32,
    y: f32,
    pressure: f32,
};
pub const SDL_PenTouchEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    touchID: i64,
    fingerID: i64,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
    windowID: u32,
};
pub const SDL_PenMotionEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    penID: i64,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
};
pub const SDL_PenButtonEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    penID: i64,
    button: u32,
    state: u32,
};
pub const SDL_PenAxisEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    penID: i64,
    axis: u32,
    pressure: f32,
    value: f32,
};
pub const SDL_DropEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    file: [*c]u8,
    file_len: i32,
};
pub const SDL_ClipboardEvent = extern struct {
    type: u32,
    reserved: u32,
    timestamp: u64,
    windowID: u32,
    clipboard: [*c]u8,
    clipboard_len: i32,
};
pub const SDL_Event = extern union {
    type: Event_Type, // Uint32 in Zig
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    kdevice: SDL_KeyboardDeviceEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: SDL_MouseDeviceEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jdevice: SDL_JoyDeviceEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jbattery: SDL_JoyBatteryEvent,
    gdevice: SDL_GamepadDeviceEvent,
    gaxis: SDL_GamepadAxisEvent,
    gbutton: SDL_GamepadButtonEvent,
    gtouchpad: SDL_GamepadTouchpadEvent,
    gsensor: SDL_GamepadSensorEvent,
    adevice: SDL_AudioDeviceEvent,
    cdevice: SDL_CameraDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    tfinger: SDL_TouchFingerEvent,
    pproximity: SDL_PenProximityEvent,
    ptouch: SDL_PenTouchEvent,
    pmotion: SDL_PenMotionEvent,
    pbutton: SDL_PenButtonEvent,
    paxis: SDL_PenAxisEvent,
    drop: SDL_DropEvent,
    clipboard: SDL_ClipboardEvent,
    padding: [128]u8,
};

pub const Event_Type = enum(u32) {
    SDL_Quit = 256,
    SDL_APP_TERMINATING = 257,
    SDL_APP_LOWMEMORY = 258,
    SDL_APP_WILLENTERBACKGROUND = 259,
    SDL_APP_DIDENTERBACKGROUND = 260,
};

pub const INIT_FLAG = enum(u32) {
    VIDEO = 1,
    AUDIO = 16,
    TIMER = 32,
    EVENTS = 64,
    GAMECONTROLLER = 512,
    JOYSTICK = 256,
    SENSOR = 4096,
    HAPTIC = 65536,
    EVERYTHING = 1 | 16 | 32 | 64 | 512 | 256 | 4096 | 65536,
};
pub const SDL_WINDOW_RESIZEABLE_FLAG = 0x0002;
pub extern "SDL3" fn SDL_Init(flags: INIT_FLAG) callconv(.C) c_int;
pub extern "SDL3" fn SDL_CreateWindow(title: [*c]const u8, w: c_int, h: c_int, flags: u64) callconv(.C) [*c]SDL_Window;
pub extern "SDL3" fn SDL_CreateRenderer(window: [*c]SDL_Window, name: [*c]const u8) callconv(.C) [*c]SDL_Renderer;
pub extern "SDL3" fn SDL_RenderClear(renderer: [*c]SDL_Renderer) callconv(.C) void;
pub extern "SDL3" fn SDL_SetRenderDrawColor(renderer: [*c]SDL_Renderer, r: u8, g: u8, b: u8, a: u8) callconv(.C) void;
pub extern "SDL3" fn SDL_RenderPresent(renderer: [*c]SDL_Renderer) callconv(.C) void;
pub extern "SDL3" fn SDL_DestroyRenderer(renderer: [*c]SDL_Renderer) callconv(.C) void;
pub extern "SDL3" fn SDL_DestroyWindow(window: [*c]SDL_Window) callconv(.C) void;
pub extern "SDL3" fn SDL_PollEvent(event: [*c]SDL_Event) callconv(.C) c_int;
pub extern "SDL3" fn SDL_Delay(ms: c_int) callconv(.C) void;
pub extern "SDL3" fn SDL_DelayPrecise(ns: u64) callconv(.C) void;
