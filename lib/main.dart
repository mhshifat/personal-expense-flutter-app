import 'package:flutter/material.dart';

import "./widgets/pages/my_home_page.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expences",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        errorColor: Colors.red,
        fontFamily: "Quicksand",
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 15,
          )
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        )
      ),
      home: const MyHomePage(),
    );
  }
}
