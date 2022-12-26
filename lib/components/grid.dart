import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GridDemoComp extends StatelessWidget {
  const GridDemoComp({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => boxItem(),
    );
  }

  Widget boxItem() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 160,
          height: 150,
          color: Colors.red,
        ),
      );
}
