import 'package:flutter/cupertino.dart';

class SecondTabComp extends StatelessWidget {
  const SecondTabComp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "second tab",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
