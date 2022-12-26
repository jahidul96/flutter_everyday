import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondTabComp extends StatelessWidget {
  const SecondTabComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "second tab",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
