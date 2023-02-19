import 'package:flutter/material.dart';

class JumpingAlignmentComp extends StatefulWidget {
  const JumpingAlignmentComp({super.key});

  @override
  State<JumpingAlignmentComp> createState() => _JumpingAlignmentCompState();
}

class _JumpingAlignmentCompState extends State<JumpingAlignmentComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hell'),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm))],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.blue, Colors.red]),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.blueAccent,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment(0, 1),
                          height: 50,
                          width: 50,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ))),
          Expanded(
              child: Container(
            color: Colors.cyan,
          )),
        ],
      ),
    );
  }
}
