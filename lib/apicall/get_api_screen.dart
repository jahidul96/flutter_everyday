// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetApiCallScreen extends StatefulWidget {
  const GetApiCallScreen({super.key});

  @override
  State<GetApiCallScreen> createState() => _GetApiCallScreenState();
}

class _GetApiCallScreenState extends State<GetApiCallScreen> {
  List products = [];
  Future fetchData() async {
    const url = "https://fakestoreapi.com/products";
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      products = json;
    });

    print(json);

    print("data fetch completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api Call page"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final title = products[index]["title"];
                    final img = products[index]["image"];
                    return Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(title),
                            Image.network(
                              img,
                              width: 100,
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: const Icon(Icons.call),
      ),
    );
  }
}
