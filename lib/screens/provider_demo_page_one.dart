import 'package:flutter/material.dart';
import 'package:flutter_everyday/provider/increase_decrease_provider.dart';
import 'package:flutter_everyday/provider/second_page.dart';
import 'package:provider/provider.dart';

class ProviderDemoPageOne extends StatefulWidget {
  const ProviderDemoPageOne({super.key});

  @override
  State<ProviderDemoPageOne> createState() => _ProviderDemoPageOneState();
}

class _ProviderDemoPageOneState extends State<ProviderDemoPageOne> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<IncreaseDecreaseProvider>(
      builder: (context, increaseDecreaseProvider, child) => Scaffold(
          appBar: AppBar(
            title: const Text("Provider demo"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                  right: 14,
                ),
                child: Text(
                  increaseDecreaseProvider.number.toString(),
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ],
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  increaseDecreaseProvider.number.toString(),
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        increaseDecreaseProvider.increase();
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        increaseDecreaseProvider.decrease();
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPageProvider(),
                    ));
              },
              label: Text("Go to"))),
    );
  }
}
