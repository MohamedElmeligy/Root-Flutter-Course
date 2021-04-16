import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("This is the first app"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        children: [
          MoodleCard("CS", "Flutter1"),
          MoodleCard("CS", "Flutter2"),
          MoodleCard("CS", "Flutter3"),
          MoodleCard("CS", "Flutter4"),
        ],
      ),
    );
  }
}

class MoodleCard extends StatelessWidget {
  MoodleCard(this.category, this.name);

  String category;
  String name;
  
  @override
  Widget build(BuildContext context) {
    String _selection = "1";
    // TODO: implement build
    return Container(
      height: 300,
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(category),
                PopupMenuButton<String>(onSelected: (String result) {
                  _selection = result;
                }, itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: "1",
                      child: Text('Working a lot harder'),
                    ),
                    PopupMenuItem<String>(
                      value: "2",
                      child: Text('Being a lot smarter'),
                    ),
                    PopupMenuItem<String>(
                      value: "3",
                      child: Text('Being a self-starter'),
                      enabled: false,
                    ),
                    PopupMenuItem<String>(
                      value: "4",
                      child: Text('Placed in charge of trading charter'),
                    ),
                  ];
                })
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                    onSurface: Colors.blue, primary: Colors.red),
                child: Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 150,
              height: 5,
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 100,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
