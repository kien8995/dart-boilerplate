import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketServerController {
  Handler get handler {
    return webSocketHandler(
      (WebSocketChannel socket) {
        socket.stream.listen(
          (dynamic message) async {
            socket.sink.add('echo $message');
          },
        );
      },
      pingInterval: const Duration(seconds: 10),
    );
  }
}
