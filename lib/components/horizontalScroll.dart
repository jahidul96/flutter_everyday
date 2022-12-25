// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardItem {
  final String img;
  final String name;

  const CardItem({required this.img, required this.name});
}

class ItemHorizontalComp extends StatefulWidget {
  const ItemHorizontalComp({super.key});

  @override
  State<ItemHorizontalComp> createState() => _ItemHorizontalCompState();
}

class _ItemHorizontalCompState extends State<ItemHorizontalComp> {
  List<CardItem> person = [
    CardItem(
      img: "https://www.w3schools.com/w3images/avatar2.png",
      name: "jahidul islam",
    ),
    CardItem(
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUQlw2FJiWn_OmJ7YmnBtVLBDKZQUF1EU0WGgZgDCldlYuJFCOcai2QQkRyOjt-4cS7XY&usqp=CAU",
      name: "akash rahman",
    ),
    CardItem(
      img: "https://www.w3schools.com/howto/img_avatar2.png",
      name: "labiba rahman",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: person.length,
          itemBuilder: (context, index) => Item(item: person[index]),
        ));
  }

  Widget Item({required CardItem item}) => Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: 160,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Container(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 4 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              item.name,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ]),
      );
}
