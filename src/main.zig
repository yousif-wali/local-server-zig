const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len != 2) {
        std.debug.print("Usage: zig run main.zig -- <port>\n", .{});
        return;
    }

    const port_result = std.fmt.parseInt(u16, args[1], 10) catch |err| {
        std.debug.print("Invalid port number: {s} (error: {any})\n", .{ args[1], err });
        return;
    };

    const port = port_result;

    const address = std.net.Address.initIp4([4]u8{ 0, 0, 0, 0 }, port);
    var listener = try address.listen(.{});

    std.debug.print("Listening on 0.0.0.0:{d}...\n", .{port});

    while (true) {
        var conn = try listener.accept();
        std.debug.print("Accepted connection\n", .{});

        const response = "HTTP/1.1 200 OK\r\nContent-Length: 13\r\n\r\nHello, world!";
        try conn.stream.writer().writeAll(response);
        std.debug.print("Response sent\n", .{});
    }
}
