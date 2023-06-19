// ignore_for_file: avoid_print, unused_import, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_everyday/features/socket_instance.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SocketInstance socketInstance = SocketInstance();

  @override
  void initState() {
    super.initState();
    socketInstance.initSocket();
  }

  @override
  void dispose() {
    socketInstance.socket.destroy();
    socketInstance.socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
    );
  }
}
