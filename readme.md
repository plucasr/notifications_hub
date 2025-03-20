# gRPC Notification Server

This is a simple gRPC server that handles notifications. It receives notification requests and prints them to the console.

## Prerequisites

- Ruby installed
- Bundler installed (`gem install bundler`)

## Getting Started

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd GRPC_SERVER
    ```

2.  **Install dependencies:**

    ```bash
    bundle install
    ```

3.  **Generate gRPC stubs:**

    If you've made any changes to `notifications.proto`, you'll need to regenerate the Ruby gRPC stubs:

    ```bash
    grpc_tools_ruby_protoc -I . --ruby_out=. --grpc_out=. notifications.proto
    ```

    Ensure that `grpc-tools` gem is installed.

4.  **Run the server:**

    ```bash
    ruby server.rb
    ```

    The server will start and listen on `0.0.0.0:50051`.

## Files

-   **`Gemfile`**: Lists the Ruby gem dependencies.
-   **`Gemfile.lock`**: Specifies the exact versions of the installed gems.
-   **`notifications.proto`**: Defines the gRPC service and messages.
-   **`notifications_pb.rb`**: Generated Ruby code for the Protocol Buffer messages.
-   **`notifications_services_pb.rb`**: Generated Ruby code for the gRPC service stubs.
-   **`server.rb`**: Contains the server implementation.

## Server Implementation

The server implementation is in `server.rb`. It defines a `NotificationServer` class that inherits from `Notifications::NotificationService::Service`. The `send_notification` method is called when a notification request is received.

## How to use

Once the server is running, you can send gRPC requests to it using a gRPC client. The server will receive the requests and print the notification details to the console.

## Example gRPC Request (using `grpcurl`)

```bash
grpcurl -plaintext -d '{
  "userId": 123,
  "message": "Hello, gRPC!",
  "messageType": "info"
}' -import-path . -proto notifications.proto 0.0.0.0:50051 notifications.NotificationService/SendNotification