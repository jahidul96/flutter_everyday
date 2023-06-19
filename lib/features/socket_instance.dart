// ignore_for_file: unused_import, library_prefixes, avoid_print

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketInstance {
  late IO.Socket socket;

  initSocket() {
    socket = IO.io(
      "http://192.168.1.4:4000",
      <String, dynamic>{
        "autoConnect": false,
        "transports": ["websocket"],
      },
    );

    socket.connect();
    socket.onConnect(
        (_) => {print("connection has been made through socket io")});

    socket.on("hello", (data) => print(data));

    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }
}
