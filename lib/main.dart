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
                  color: Colors.white,
                  fontFamily: "pobbins",
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
              bodyText1: TextStyle(
                  color: Colors.white,
                  fontFamily: "pobbins",
                  fontWeight: FontWeight.w500,
                  fontSize: 15))),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 1,
          title: Center(child: Text("Stauts Bar & Navigation Bar", style: Theme.of(context).textTheme.headline1)),
          ),
    );
  }
}
