// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class DemoApiCallScreen extends StatefulWidget {
  const DemoApiCallScreen({super.key});

  @override
  State<DemoApiCallScreen> createState() => _DemoApiCallScreenState();
}

class User {
  String name;
  String email;
  String desc;
  bool isAdmin;

  User(this.name, this.desc, this.email, this.isAdmin);
}

class _DemoApiCallScreenState extends State<DemoApiCallScreen> {
  // initiallized a empty map data placeholder
  User user = User("", "", "", false);
  List users = [];

// fetching data
  fetchData() async {
    try {
      final baseUrl = "http://192.168.1.4:4000/user";
      final parsedUrl = Uri.parse(baseUrl);
      final response = await http.get(parsedUrl);
      print(response.statusCode);

      final body = response.body;
      final data = jsonDecode(body);

      setState(() {
        user.name = data["name"];
        user.email = data["email"];
        user.desc = data["desc"];
        user.isAdmin = data["isAdmin"];
      });
    } catch (e) {
      print("error $e");
    }
  }

// fetch list of data
  getUsers() async {
    try {
      final baseUrl = "http://192.168.1.4:4000/all/users";
      final parsedUrl = Uri.parse(baseUrl);
      final response = await http.get(parsedUrl);
      print(response.statusCode);

      final body = response.body;
      final data = jsonDecode(body);

      print(data);

      setState(() {
        users = data;
      });
    } catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo api call page")),
      body: SafeArea(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final sUser = User(users[index]["name"], users[index]["desc"],
                    users[index]["email"], users[index]["isAdmin"]);
                return ListTile(
                  title:
                      sUser.name.isEmpty ? Text("Username") : Text(sUser.name),
                  subtitle: sUser.email.isEmpty
                      ? Text("username@gmail.com")
                      : Text(sUser.email),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: getUsers,
        child: Icon(Icons.add),
      ),
    );
  }
}
