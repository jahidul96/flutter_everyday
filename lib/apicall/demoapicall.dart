import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class DemoApiCallScreen extends StatefulWidget {
  const DemoApiCallScreen({super.key});

  @override
  State<DemoApiCallScreen> createState() => _DemoApiCallScreenState();
}

class _DemoApiCallScreenState extends State<DemoApiCallScreen> {
  // initiallized a empty map data placeholder
  Map? product;

// fetching data
  fetchData() async {
    final baseUrl = "https://fakestoreapi.com/products/1";
    final parsedUrl = Uri.parse(baseUrl);
    final response = await http.get(parsedUrl);
    final body = response.body;
    final maindata = jsonDecode(body);

    setState(() {
      product = maindata;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo api call page")),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product == null ? Text("data loading") : Text(product!["title"]),
          ],
        ),
      ),
    );
  }
}
