// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_everyday/data/userData.dart';

class UnderStandObjMap extends StatefulWidget {
  const UnderStandObjMap({super.key});

  @override
  State<UnderStandObjMap> createState() => _UnderStandObjMapState();
}

class _UnderStandObjMapState extends State<UnderStandObjMap> {
  List<UserData> userData = [
    UserData(
      username: "rahim",
      age: 25,
      email: "rahim@gmail.com",
      address: "dhaka, bangladesh",
      phone: "019334959966",
    ),
    UserData(
      username: "karim",
      age: 35,
      email: "karim@gmail.com",
      address: "barishal, bangladesh",
      phone: "019334959966",
    ),
    UserData(
      username: "saiful",
      age: 28,
      email: "saiful@gmail.com",
      address: "chottagong, bangladesh",
      phone: "019334959966",
    ),
    UserData(
      username: "Rahat",
      age: 26,
      email: "Rahat@gmail.com",
      address: "chottagong, bangladesh",
      phone: "019334959966",
    ),
    UserData(
      username: "saimon",
      age: 28,
      email: "saimon@gmail.com",
      address: "chottagong, bangladesh",
      phone: "019334959966",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemBuilder: (context, index) =>
                userBuilder(person: userData[index]),
            itemCount: userData.length));
  }

  Widget userBuilder({required UserData person}) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "https://www.w3schools.com/w3images/avatar2.png",
                width: 60,
                height: 60,
              ),
            ),
            SizedBox(height: 10),
            Text(
              person.username,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              person.email,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              person.age.toString(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              person.address,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              person.phone,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
}
