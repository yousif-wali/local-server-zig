
# Zig HTTP Server

This is a simple HTTP server written in Zig. It listens on a specified port and responds with a static "Hello, world!" message to all incoming connections.

## Usage

1. **Compile and Run**:
   Make sure you have Zig installed. You can run the server directly using:

   ```bash
   zig run main.zig -- <port>
   ```

   Replace `<port>` with the desired port number (e.g., `3999`).

   Example:
   ```bash
   zig run main.zig -- 3999
   ```

2. **Expected Output**:
   - On success:
     ```
     Listening on 0.0.0.0:3999...
     ```
   - On invalid port input:
     ```
     Invalid port number: <invalid_port> (error: <error_type>)
     ```
   - If no port is provided:
     ```
     Usage: zig run main.zig -- <port>
     ```

3. **Access the Server**:
   Use a web browser or any HTTP client (e.g., `curl`) to access the server:
   ```bash
   curl http://localhost:<port>
   ```

   Example:
   ```bash
   curl http://localhost:3999
   ```

   This will return:
   ```
   Hello, world!
   ```

## Code Explanation

1. **Dynamic Port Configuration**:
   - The port is passed as a command-line argument.
   - If invalid or missing, the server displays an appropriate error message.

2. **Response Handling**:
   - The server sends a static HTTP response with "Hello, world!" as the content.

3. **Error Handling**:
   - Ensures robust input validation for the port number.

## Requirements

- Zig (tested with version 0.13.0)
- A terminal to run the commands.

## License

This project is open source and licensed under the MIT License.
