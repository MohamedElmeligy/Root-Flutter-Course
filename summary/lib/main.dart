import 'package:flutter/material.dart';

import 'package:summary/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> messages = [
    {
      "name": "Ahmed",
      "lastMessage": "Good Morning, how is your day?",
      "date": "11:00 PM",
      "unseenCount": "6",
    },
    {
      "name": "Mohammed",
      "lastMessage": "Good Morning, how is your day?",
      "date": "11:00 PM",
      "unseenCount": "6",
    },
    {
      "name": "Mohaned",
      "lastMessage": "Good Morning, how is your day?",
      "date": "11:00 PM",
      "unseenCount": "6",
    },
  ];

  void addMessage(
      String name, String lastMessage, String date, String unseenCount) {
    messages.add(
      {
        "name": name,
        "lastMessage": lastMessage,
        "date": date,
        "unseenCount": unseenCount,
      },
    );
    setState(() {});
  }


  void deleteMessage(int index) {
    messages.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("WhatsApp"),
        actions: [
          Icon(Icons.more_vert),
          Icon(Icons.message),
          Icon(Icons.search),
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () {
              deleteMessage(index);
            },
            onTap: () {
              addMessage(
                messages[index]["name"],
                messages[index]["lastMessage"],
                messages[index]["date"],
                messages[index]["unseenCount"],
              );
            },
            child: MessageTile(
              messages[index]["name"],
              messages[index]["lastMessage"],
              messages[index]["date"],
              messages[index]["unseenCount"],
            ),
          );
        },
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  MessageTile(this.name, this.lastMessage, this.date, this.unseenCount);

  final String name;
  final String lastMessage;
  final String date;
  final String unseenCount;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(shape: BoxShape.circle),
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Image(
              height: 75,
              width: 75,
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(lastMessage),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(date),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green[800],
                  ),
                  child: Center(child: Text(unseenCount)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
