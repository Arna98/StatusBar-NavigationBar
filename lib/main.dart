import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<bool> _selection = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 1,
        title: Center(
            child: Text("Stauts Bar & Navigation Bar",
                style: Theme.of(context).textTheme.headline1)),
      ),
      body: Column(children: [
        Text("Hide Staus Bar & Navigation Bar :",
            style: Theme.of(context).textTheme.bodyText1),
        ToggleButtons(
            isSelected: _selection,
            color: Colors.black,
            selectedColor: Colors.white,
            fillColor: Colors.blue.shade900,
            renderBorder: false,
            onPressed: (index) {
              setState(() {
                for (int myIndex = 0; myIndex < _selection.length; myIndex++) {
                  if (myIndex == index) {
                    _selection[myIndex] = true;
                  } else {
                    _selection[myIndex] = false;
                  }
                }
              });
              switch (index) {
                case 0:
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
                  break;
                case 1:
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
                  break;
                case 2:
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
                  break;
                case 3:
                  SystemChrome.setEnabledSystemUIMode(
                      SystemUiMode.immersiveSticky);
                  break;
              }
            },
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("None",
                    style: TextStyle(
                        fontFamily: "pobbins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("LeanBack",
                    style: TextStyle(
                        fontFamily: "pobbins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Immersive",
                    style: TextStyle(
                        fontFamily: "pobbins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("ImmersiveSticky",
                    style: TextStyle(
                        fontFamily: "pobbins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
            ]),
      ]),
    );
  }
}
