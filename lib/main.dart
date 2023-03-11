import 'package:flutter/material.dart';
import 'package:flutter_everyday/components/tabbar_inmiddle.dart';
import 'package:flutter_everyday/provider/increase_decrease_provider.dart';
import 'package:flutter_everyday/provider/todoapp_provider.dart';
import 'package:flutter_everyday/screens/todoappwithprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IncreaseDecreaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoAppProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TabBarIntheMiddle(),
      ),
    );
  }
}
