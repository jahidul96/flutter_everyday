import 'package:flutter/material.dart';
import 'package:flutter_everyday/provider/increase_decrease_provider.dart';
import 'package:provider/provider.dart';

class SecondPageProvider extends StatelessWidget {
  const SecondPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IncreaseDecreaseProvider>(
      builder: (context, increaseDecreaseProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Secondpage"),
        ),
        body: Center(
          child: Text(
            increaseDecreaseProvider.number.toString(),
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            increaseDecreaseProvider.decrease();
          },
          child: const Icon(Icons.remove),
        ),
      ),
    );
  }
}
