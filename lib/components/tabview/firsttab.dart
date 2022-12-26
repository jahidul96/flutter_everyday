import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstTabComp extends StatelessWidget {
  const FirstTabComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "first tab",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
