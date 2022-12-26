import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThirdTabComp extends StatelessWidget {
  const ThirdTabComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Third tab",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
