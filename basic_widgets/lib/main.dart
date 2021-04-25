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
  int counter = 6;

  List<MessageTile> messages = [
    MessageTile("Name: hi", "Message number: 1", "11:00 AM", "1"),
    MessageTile("Name: bye", "Message number: 1", "11:00 AM", "1"),
    MessageTile("Name: lol", "Message number: 1", "11:00 AM", "1"),
    MessageTile("Name: lmao", "Message number: 1", "11:00 AM", "1"),
    MessageTile("Name: ez", "Message number: 1", "11:00 AM", "1"),
    MessageTile("Name: gg", "Message number: 1", "11:00 AM", "1"),
    MessageTile("Name: cyka", "Message number: 1", "11:00 AM", "1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        actions: [
          Icon(Icons.more_vert, size: 34),
          Icon(Icons.message, size: 34),
          Icon(Icons.search, size: 34),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onLongPress: () {
            messages.removeAt(index);
            setState(() {});
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: messages[index],
          ),
        ),
        separatorBuilder: (context, indx) => Divider(height: 5),
        itemCount: messages.length,
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  MessageTile(this.name, this.lastMessage, this.date, this.noOfMsg);

  final String name;
  final String lastMessage;
  final String date;
  final String noOfMsg;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(left: 20),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(lastMessage),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(date),
              Container(
                height: 30,
                width: 30,
                child: Center(child: Text(noOfMsg)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class MoodleCard extends StatelessWidget {
//   MoodleCard(this.category, this.name);

//   String category;
//   String name;

//   @override
//   Widget build(BuildContext context) {
//     String _selection = "1";
//     // TODO: implement build
//     return Container(
//       height: 300,
//       width: 200,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image(
//               image: NetworkImage(
//                 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text(category),
//                 PopupMenuButton<String>(onSelected: (String result) {
//                   _selection = result;
//                 }, itemBuilder: (BuildContext context) {
//                   return [
//                     PopupMenuItem<String>(
//                       value: "1",
//                       child: Text('Working a lot harder'),
//                     ),
//                     PopupMenuItem<String>(
//                       value: "2",
//                       child: Text('Being a lot smarter'),
//                     ),
//                     PopupMenuItem<String>(
//                       value: "3",
//                       child: Text('Being a self-starter'),
//                       enabled: false,
//                     ),
//                     PopupMenuItem<String>(
//                       value: "4",
//                       child: Text('Placed in charge of trading charter'),
//                     ),
//                   ];
//                 })
//               ],
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 10),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                     onSurface: Colors.blue, primary: Colors.red),
//                 child: Text(
//                   name,
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//             Container(
//               width: 150,
//               height: 5,
//               margin: EdgeInsets.only(left: 10),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 50,
//                     color: Colors.blue,
//                   ),
//                   Container(
//                     width: 100,
//                     color: Colors.red,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
