import 'package:flutter/material.dart';
import 'package:flutter_everyday/apicall/demoapicall.dart';
import 'package:flutter_everyday/apicall/get_api_screen.dart';
import 'package:flutter_everyday/components/appBar.dart';
import 'package:flutter_everyday/components/card_comp.dart';
import 'package:flutter_everyday/components/drawerDemo.dart';
import 'package:flutter_everyday/components/tabview/tabbar.dart';
import 'package:flutter_everyday/screens/home.dart';

void main() {
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
      home: DemoApiCallScreen(),
    );
  }
}
