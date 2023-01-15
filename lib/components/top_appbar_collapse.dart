import 'package:flutter/material.dart';

class TopappbarCollapsable extends StatelessWidget {
  TopappbarCollapsable({super.key});

  String img =
      "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819__340.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            leading: Icon(Icons.menu),
            title: Text("Appbar"),
            actions: [Icon(Icons.settings)],
            collapsedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                img,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 100,
            (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Text("1")),
                title: Text("hell"),
                subtitle: Text("123"),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              );
            },
          ))
        ],
      ),
    );
  }
}
