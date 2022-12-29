import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardComp extends StatelessWidget {
  String img =
      "https://static.vecteezy.com/system/resources/previews/004/476/164/original/young-man-avatar-character-icon-free-vector.jpg";

  CardComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card demo")),
      body: Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        width: double.infinity,
        child: Column(
          children: [
            ReuseCard(name: "akash"),
            ReuseCard(name: "rahim"),
            ReuseCard(name: "karim"),
          ],
        ),
      ),
    );
  }

  Widget ReuseCard({required name}) => Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  img,
                  width: 60,
                  height: 60,
                ),
                SizedBox(height: 7),
                Text(name),
              ],
            ),
          ),
        ),
      );
}
