// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_everyday/components/tabview/firsttab.dart';
import 'package:flutter_everyday/components/tabview/secondtab.dart';
import 'package:flutter_everyday/components/tabview/thirdtab.dart';

class PageTabBarComp extends StatelessWidget {
  const PageTabBarComp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabbar"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 1st tab
                  FirstTabComp(),

                  // 2nd tab
                  SecondTabComp(),

                  // 3rd tab
                  ThirdTabComp(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
