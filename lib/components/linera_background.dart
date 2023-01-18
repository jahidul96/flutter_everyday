import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LinearBackGroundPage extends StatelessWidget {
  const LinearBackGroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.blue]),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Text("no.")),
              title: Text("title"),
              subtitle: Text("subtitle"),
              trailing: Icon(Icons.delete),
              focusColor: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
