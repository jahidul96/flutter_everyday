// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_everyday/components/grid.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: GridDemoComp(),
      ),
    );
  }
}
