import 'package:flutter/material.dart';
import 'package:flutter_everyday/apicall/demoapicall.dart';
import 'package:flutter_everyday/components/large_appbar.dart';
import 'package:flutter_everyday/components/top_appbar_collapse.dart';
import 'package:flutter_everyday/file_pick/image_pickerpage.dart';
import 'package:flutter_everyday/small_projects_with_api/addRemoveUser/user_add_remove_with_node.dart';

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
      home: UserAddRemove(),
    );
  }
}
