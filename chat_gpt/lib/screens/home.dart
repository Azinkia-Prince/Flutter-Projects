import 'package:chat_gpt/constants/colors.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 55,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset(
            'assets/images/chat-gpt-logo.png',
          ),
        ),
        title: Text('Chat GPT'),
        backgroundColor: appbarClr,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      backgroundColor: Color(0xFF343541),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 105,
              itemBuilder: (context, index) {
                return Text(
                  "Flutter is a powerful framework",
                  style: TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          Material(
              color: Color(0xFF40414f),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: textEditingController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'How can i help you?',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.send, color: appbarClr)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
