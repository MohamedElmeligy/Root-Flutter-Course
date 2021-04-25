import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController controller = new TextEditingController();

  List<String> texts = [];

  void add() {
    texts.add(controller.text);
    controller.clear();
    setState(() {});
  }

  void delete() {
    texts.removeLast();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return index == 0
                  ? ElevatedButton(onPressed: add, child: Text("Add"))
                  : index == 1
                      ? ElevatedButton(onPressed: delete, child: Text("Delete"))
                      : Text(texts[index - 2]);
            },
            itemCount: texts.length + 2,
          ),
        ],
      ),
    );
  }
}
