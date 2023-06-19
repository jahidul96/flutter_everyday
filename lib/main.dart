// ignore_for_file: unused_import

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_everyday/screens/camera_screen.dart';

import 'package:flutter_everyday/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_everyday/screens/lock_screen.dart';
import 'package:flutter_everyday/screens/video_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
