import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard({this.item});

  final Map<String,dynamic> item;
  

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: sw * 0.5 * 0.5,
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(
                        "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX3047058.jpg"),
                  ),
                  Positioned(
                    right: 20,
                    top: 20,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Center(child: Text("${item['discount'] * 100}%")),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(
              item['description'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "${item['price'] - (item['price'] * item['discount'])}",
                  
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  item['price'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              item['rate'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            item['isInterest']
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Without Intrests"),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
