import 'package:flutter/material.dart';
import 'package:flutter_everyday/components/alignmentcomp.dart';
import 'package:flutter_everyday/components/graph_view_demo.dart';
import 'package:flutter_everyday/components/linera_background.dart';

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
      home: TreeViewPage(),
    );
  }
}
