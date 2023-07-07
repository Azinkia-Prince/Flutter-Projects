import 'package:chat_gpt/constants/colors.dart';
import 'package:chat_gpt/constants/dummy-data.dart';
import 'package:chat_gpt/widget/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class homeScreen extends StatelessWidget {
  bool _textLoading = true;
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
        actions: [
          IconButton(
              onPressed: () async{
              await showModalBottomSheet(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                  backgroundColor: scaffoldClr,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select a model : ',style: TextStyle(fontSize: 17),),
                          Flexible(child: dropDown())
                        ],

                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.more_vert))
        ],
      ),
      backgroundColor: Color(0xFF343541),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: dummyJson.length,
              itemBuilder: (context, index) {
                String msg = dummyJson[index]['msg'].toString();
                int chatIndex =
                    int.parse(dummyJson[index]['chatIndex'].toString());
                return Flexible(
                  child: Material(
                    color: chatIndex == 0 ? cardColor : scaffoldClr,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            chatIndex == 0
                                ? 'assets/images/man-avatar-logo.png'
                                : 'assets/images/ai-logo.png',
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(child: Text(msg)),
                          chatIndex == 0
                              ? SizedBox.shrink()
                              : Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.thumb_up_alt,
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.thumb_down_alt,
                                          size: 15,
                                          color: Colors.white,
                                        ))
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_textLoading) ...[
            SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            )
          ],
          SizedBox(
            height: 5,
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
                        icon: Icon(Icons.send, color: Colors.white)),
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
