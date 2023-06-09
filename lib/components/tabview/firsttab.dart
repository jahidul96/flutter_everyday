import 'package:flutter/cupertino.dart';

class FirstTabComp extends StatelessWidget {
  const FirstTabComp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "first tab",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
