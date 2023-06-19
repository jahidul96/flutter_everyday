// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class NotificationServices {
  FirebaseMessaging fmMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

// local notification initialization
  void initLocalNotification(RemoteMessage message) async {
    var androidInitialization =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettings =
        InitializationSettings(android: androidInitialization);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

// request permision
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

// get device token for fbmessaging
  Future<String> getToken() async {
    String? token = await fmMessaging.getToken();

    return token!;
  }

// initialization for messaging
  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      initLocalNotification(message);
      showNotification(message);
    });
  }

// show notification
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
            Random.secure().nextInt(100000000).toString(),
            "High Importance notification",
            importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(androidNotificationChannel.id.toString(),
            androidNotificationChannel.name.toString(),
            channelDescription: "channel description",
            importance: Importance.high,
            priority: Priority.high,
            ticker: "ticker");

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    Future.delayed(
      Duration.zero,
      () {
        flutterLocalNotificationsPlugin.show(
            0,
            message.notification!.title.toString(),
            message.notification!.body.toString(),
            notificationDetails);
      },
    );
  }
}

// send push notification func with reciver device token/ title/ message
sendPushNotificationToUser({
  required String title,
  required String pushToken,
  required String message,
}) async {
  final body = {
    "to": pushToken,
    "notification": {
      "title": title,
      "body": message,
    }
  };

  var url = Uri.parse("https://fcm.googleapis.com/fcm/send");

// server key of firebase cloud messaging
  var serverKey = "";

  try {
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "key=$serverKey",
        },
        body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } catch (e) {
    print(e);
  }
}
