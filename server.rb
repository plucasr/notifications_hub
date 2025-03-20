require "grpc"
require_relative "./notifications_pb"
require_relative "./notifications_services_pb"

class NotificationServer < Notifications::NotificationService::Service
  def send_notification(notification_req, _unused_call)
    #propagate and handle notification here
    puts "Received notification for user #{notification_req.userId}: #{notification_req.message} (Type: #{notification_req.messageType})"
    Google::Protobuf::Empty.new
  end
end

def start_server
  server = GRPC::RpcServer.new
  server.add_http2_port("0.0.0.0:50051", :this_port_is_insecure)
  server.handle(NotificationServer)
  puts "gRPC server running on 0.0.0.0:50051"
  server.run_till_terminated
end

start_server
