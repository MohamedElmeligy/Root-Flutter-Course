import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController controller = new TextEditingController();

  List<String> messages = [];

  void addMessage() {
    messages.add(controller.text);
    controller.clear();
    setState(() {});
    print(messages);
  }

  void deleteMessage() {
    messages.removeLast();
    setState(() {});
    print(messages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive UI"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () => addMessage(), child: Text("Add")),
          ElevatedButton(
              onPressed: () => deleteMessage(), child: Text("Delete")),
          ListView.builder(
            shrinkWrap: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Text(messages[index]);
            },
          ),
        ],
      ),
    );
  }
}
