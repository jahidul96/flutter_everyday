import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class GetApiCallScreen extends StatefulWidget {
  const GetApiCallScreen({super.key});

  @override
  State<GetApiCallScreen> createState() => _GetApiCallScreenState();
}

class _GetApiCallScreenState extends State<GetApiCallScreen> {
  List products = [];
  Future fetchData() async {
    print("data fetching...");

    const url = "https://fakestoreapi.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

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
        title: Text("Get Api Call page"),
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
                    return Container(
                      color: Colors.amber,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title),
                      ),
                    );
                  }))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: Icon(Icons.call),
      ),
    );
  }
}
