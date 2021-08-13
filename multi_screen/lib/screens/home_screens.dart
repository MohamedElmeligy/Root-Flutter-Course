import 'package:flutter/material.dart';

import 'package:multi_screen/components/item_card.dart';
import 'package:multi_screen/screens/item_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Map<String, dynamic>> items = [
  {
    "description": "This is a description  about  anything anything",
    "discount": 0.15,
    "price": 750,
    "rate": "Or 500 L.E/month",
    "isInterest": true,
  },
  {
    "description": "This is a description  about anything",
    "discount": 0.3,
    "price": 15000,
    "rate": "Or 500 L.E/month",
    "isInterest": true
  },
  {
    "description": "This is a description  about anything anything anything",
    "discount": 0.3,
    "price": 175000,
    "rate": "Or 500 L.E/month",
    "isInterest": true,
  },
  {
    "description": "This is a description  about anything",
    "discount": 0.3,
    "price": 1000,
    "rate": "Or 500 L.E/month",
    "isInterest": true,
  },
];

class _HomeScreenState extends State<HomeScreen> {
  //Description
  //discount
  //price
  //rate
  //isInterest

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Partition(),
            Partition(),
            Partition(),
            Partition(),
            Partition(),
            Partition(),
          ],
        ),
      ),
    );
  }
}

class Partition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://images.unsplash.com/photo-1607082350899-7e105aa886ae?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80")),
      ),
      height: sh * 0.6,
      child: Column(
        children: [
          Container(
            height: sh * 0.2,
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  width: sw * 0.75,
                  child: Text(
                    "Offers",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Shop",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: sh * 0.4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: sw * 0.4,
                  height: sh * 0.35,
                  child: ItemCard(
                    item: items[0],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItemScreen()));
                  },
                  child: Container(
                    width: sw * 0.4,
                    height: sh * 0.35,
                    child: ItemCard(item: items[0]),
                  ),
                ),
                Container(
                    width: sw * 0.4,
                    height: sh * 0.35,
                    child: ItemCard(item: items[1])),
                Container(
                    width: sw * 0.4,
                    height: sh * 0.35,
                    child: ItemCard(item: items[2])),
                Container(
                    width: sw * 0.4,
                    height: sh * 0.35,
                    child: ItemCard(item: items[3])),
              ],
            ),
          )
        ],
      ),
    );
  }
}
