// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  FirebaseMessaging fmMessaging = FirebaseMessaging.instance;

  void requestPermissonNotification() async {
    NotificationSettings settings = await fmMessaging.requestPermission(
      alert: true,
      sound: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("permission granted");
    } else {
      print("permision denied");
    }
  }

  Future<String> getToken() async {
    String? token = await fmMessaging.getToken();

    return token!;
  }
}
