import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
          fontFamily: "pobbins",
          textTheme: const TextTheme(
              headline1: TextStyle(
                  color: Colors.black,
                  fontFamily: "pobbins",
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
              bodyText1: TextStyle(
                  color: Colors.white,
                  fontFamily: "pobbins",
                  fontWeight: FontWeight.w500,
                  fontSize: 17))),
    );
  }
}
