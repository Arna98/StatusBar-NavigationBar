import 'package:flutter/cupertino.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'System Staus Bar & Navigation Bar',
      theme: ThemeData(
          fontFamily: "pobbins",
          textTheme: const TextTheme(
              headline1: TextStyle(
                  color: Colors.white,
                  fontFamily: "pobbins",
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
              bodyText1: TextStyle(
                  color: Colors.black,
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
        leading: const BackButton(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.search))
        ],
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
                  _showSnakeBar(context, "exited FullScreen Mode.");
                  break;
                case 1:
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
                  _showSnakeBar(context,
                      "tapping anywhere on the display to exit fullscreen Mode.");
                  break;
                case 2:
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
                  _showSnakeBar(context,
                      "through a swipe gesture at the edges of the display to exit fullscreen Mode.");
                  break;
                case 3:
                  SystemChrome.setEnabledSystemUIMode(
                      SystemUiMode.immersiveSticky);
                  _showSnakeBar(context,
                      "through a swipe gesture at the edges of the display to exit fullscreen Mode.");
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
        ElevatedButton(
            onPressed: () => _setColorNavigationBar(),
            child: Text("Color Navigation Bar",
                style: Theme.of(context).textTheme.bodyText1)),
        ElevatedButton(
            onPressed: () => _setColorStatusBar(),
            child: Text("Color Status Bar",
                style: Theme.of(context).textTheme.bodyText1)),
        ElevatedButton(
            onPressed: () => _setDefaultColorBars(),
            child: Text("Color Status Bar",
                style: Theme.of(context).textTheme.bodyText1)),
      ]),
    );
  }
}

_showSnakeBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: Theme.of(context).textTheme.headline1),
    backgroundColor: Colors.red.shade400,
  ));
}

Future _setColorNavigationBar() async {
  const style = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.orange,
      systemNavigationBarDividerColor: Colors.orange,
      systemNavigationBarIconBrightness: Brightness.dark);

  SystemChrome.setSystemUIOverlayStyle(style);
}

Future _setColorStatusBar() async {
  const style = SystemUiOverlayStyle(
      statusBarColor: Colors.orange, statusBarIconBrightness: Brightness.dark);

  SystemChrome.setSystemUIOverlayStyle(style);
}

Future _setDefaultColorBars() async {
  const style = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.blueGrey,
      statusBarIconBrightness: Brightness.light);

  SystemChrome.setSystemUIOverlayStyle(style);
}
