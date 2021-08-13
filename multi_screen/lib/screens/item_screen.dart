import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "dsaiugsaidhgasidgasiygdasuigdiuas",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            CarouselSlider.builder(
              itemCount: 15,
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (BuildContext context, int itemIndex, _) =>
                  Container(
                child: Image(
                  image: NetworkImage(
                      "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX3047058.jpg"),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: '2699 ',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'save 700 L.E ',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  TextSpan(
                    text: '(26%)',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal, color: Colors.red),
                  ),
                ],
              ),
            ),
            Text(
              "1999",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("96 L.E / 36 months"),
            ),
            Container(
              height: 200,
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.wallet_giftcard),
                      Text("dsaadasda"),
                      Text("dsaadasda"),
                    ],
                  ),
                  Divider(
                    height: double.maxFinite,
                    thickness: 3,
                  ),
                  Column(
                    children: [
                      Icon(Icons.wallet_giftcard),
                      Text("dsaadasda"),
                      Text("dsaadasda"),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.car_rental),
                  Text("Add to Cart"),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.headset),
                  Text("Add to favourite"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
