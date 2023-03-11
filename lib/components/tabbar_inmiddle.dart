import 'package:flutter/material.dart';

class TabBarIntheMiddle extends StatefulWidget {
  const TabBarIntheMiddle({super.key});

  @override
  State<TabBarIntheMiddle> createState() => _TabBarIntheMiddleState();
}

class _TabBarIntheMiddleState extends State<TabBarIntheMiddle> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tabbar middle"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: Colors.red,
                height: 50,
                child: const Center(
                    child: Text(
                  "Tabbar in the middle",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            const TabBar(
              labelColor: Colors.red,
              padding: EdgeInsets.only(
                top: 10,
              ),
              labelPadding: EdgeInsets.only(bottom: 10),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Text("All"),
                Text("Popular"),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  color: Colors.blue,
                  height: 200,
                  child: Center(
                    child: Text("All Tab"),
                  ),
                ),
                Container(
                  height: 200,
                  color: Colors.amber,
                  child: Center(
                    child: Text("Popular Tab"),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
