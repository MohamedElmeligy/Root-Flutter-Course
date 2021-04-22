import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHpageState();
  }
}

class _MyHpageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1,
        children: [
          YoutubeTile(),
          YoutubeTile(),
          YoutubeTile(),
          YoutubeTile(),
          YoutubeTile(),
          YoutubeTile(),
          YoutubeTile(),
          YoutubeTile(),
        ],
      ),
    );
  }
}

class YoutubeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300,
      width: 300,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            fit: BoxFit.fitWidth,
            height: 200,
            width: 300,
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 300,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image(
                    height: 50,
                    width: 50,
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title"),
                      Text("Channel"),
                      Text("Views/date"),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
