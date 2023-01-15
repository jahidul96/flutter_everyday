import 'package:flutter/material.dart';

class LargeAppBar extends StatelessWidget {
  const LargeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Icon(Icons.menu),
            title: Text("Large app bar"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1000,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
