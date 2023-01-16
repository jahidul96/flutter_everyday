// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:flutter_everyday/small_projects_with_api/addRemoveUser/add_user.dart';

class UserAddRemove extends StatefulWidget {
  const UserAddRemove({super.key});

  @override
  State<UserAddRemove> createState() => _UserAddRemoveState();
}

// data model

class _UserAddRemoveState extends State<UserAddRemove> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UserAddReomve with Nodejs")),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddUserPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
