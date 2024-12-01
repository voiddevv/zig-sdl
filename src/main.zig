const std = @import("std");
const sdl3 = @import("sdl3.zig");
pub fn main() !void {
    _ = sdl3.SDL_Init(sdl3.INIT_FLAG.EVERYTHING);
    const window = sdl3.SDL_CreateWindow("Hello, world!", 640, 480, 32);
    const renderer = sdl3.SDL_CreateRenderer(window, null);
    defer sdl3.SDL_DestroyRenderer(renderer);
    defer sdl3.SDL_DestroyWindow(window);
    var run: i32 = 1;
    while (run == 1) {
        var event: sdl3.SDL_Event = undefined;
        while (sdl3.SDL_PollEvent(&event) != 0) {
            if (event.type == sdl3.Event_Type.SDL_Quit) {
                run = 0;
                break;
            }
        }
        sdl3.SDL_SetRenderDrawColor(renderer, 128, 128, 128, 255);
        sdl3.SDL_RenderClear(renderer);
        sdl3.SDL_RenderPresent(renderer);
        // 16.66667 ms

    }
}
