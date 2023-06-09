// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_everyday/features/push_notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestPermissonNotification();
    notificationServices.getToken().then((value) {
      print(value);
    });
    notificationServices.firebaseInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Push Notification"),
      ),
    );
  }
}
