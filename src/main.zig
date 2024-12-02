const std = @import("std");
const sdl3 = @import("sdl/sdl3.zig");
pub fn main() !void {
    var frames: u32 = 0;
    var time: u64 = 0;
    var time_offset: u64 = 0;
    _ = sdl3.SDL_Init(sdl3.INIT_FLAG.EVERYTHING);
    defer sdl3.SDL_Quit();
    const window = sdl3.SDL_CreateWindow("Hello, world!", 800, 600, 32);
    const renderer = sdl3.SDL_CreateRenderer(window, "direct3d11");
    defer sdl3.SDL_DestroyRenderer(renderer);
    defer sdl3.SDL_DestroyWindow(window);
    var run: i32 = 1;
    while (run == 1) {
        const ticks = sdl3.SDL_GetTicksNS();
        var event: sdl3.SDL_Event = undefined;
        while (sdl3.SDL_PollEvent(&event) != 0) {
            if (event.type == sdl3.Event_Type.SDL_Quit) {
                run = 0;
                break;
            }
        }
        var rect = sdl3.SDL_FRect{ .x = 0, .y = 0, .w = 114, .h = 600 };

        sdl3.SDL_SetRenderDrawColor(renderer, 0, 0, 0, 0);
        sdl3.SDL_RenderClear(renderer);

        sdl3.SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        rect.fill(renderer);
        sdl3.SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
        rect.x += 114;
        rect.fill(renderer);
        sdl3.SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);
        rect.x += 114;
        rect.fill(renderer);
        sdl3.SDL_SetRenderDrawColor(renderer, 255, 255, 0, 255);
        rect.x += 114;
        rect.fill(renderer);
        sdl3.SDL_SetRenderDrawColor(renderer, 255, 0, 255, 255);
        rect.x += 114;
        rect.fill(renderer);
        sdl3.SDL_SetRenderDrawColor(renderer, 0, 255, 255, 255);
        rect.x += 114;
        rect.fill(renderer);
        sdl3.SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        rect.x += 114;
        rect.fill(renderer);

        sdl3.SDL_RenderPresent(renderer);
        frames += 1;
        time = sdl3.SDL_GetTicksNS() - time_offset;
        if (time >= 1000000000) {
            const fps = frames;
            std.debug.print("fps: {d}\n", .{fps});
            frames = 0;
            time_offset = sdl3.SDL_GetTicksNS();
        }
        const delta = sdl3.SDL_GetTicksNS() - ticks;
        sdl3.SDL_DelayPrecise(8333333 - delta);
    }
}
