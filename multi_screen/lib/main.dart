import 'package:flutter/material.dart';

import 'package:multi_screen/screens/home_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Center(child: Text("Second Page")),
    Center(child: Text("Third page")),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _widgetOptions[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (idx) {
          currentPage = idx;
          setState(() {
            
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "3",
          ),
        ],
      ),
    );
  }
}
