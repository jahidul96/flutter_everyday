import 'package:flutter/material.dart';

class GridDemoComp extends StatelessWidget {
  const GridDemoComp({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
