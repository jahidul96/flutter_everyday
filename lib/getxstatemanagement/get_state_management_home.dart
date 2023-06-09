import 'package:flutter/material.dart';
import 'package:flutter_everyday/getxstatemanagement/increase_decrease_controller.dart';
import 'package:get/get.dart';

class GetXStateManagementHomePage extends StatefulWidget {
  const GetXStateManagementHomePage({super.key});

  @override
  State<GetXStateManagementHomePage> createState() =>
      _GetXStateManagementHomePageState();
}

class _GetXStateManagementHomePageState
    extends State<GetXStateManagementHomePage> {
  final IncreaseDecreaseController controller =
      Get.put(IncreaseDecreaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX State Management"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                controller.increase();
              },
              icon: const Icon(Icons.add),
            ),
            const SizedBox(width: 20),
            Obx(() => Text(
                  controller.number.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                controller.decrease();
              },
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
