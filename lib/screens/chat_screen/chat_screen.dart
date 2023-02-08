// import 'dart:ffi';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
   ChatScreen(this.name,  {super.key});

   String? name;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                  vertical:
                      BorderSide(width: 0.1, color: Colors.grey.shade200))),
          child: Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.grey.shade200)),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200)),
                    child: Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.pink[300],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                       widget.name != null ?   Container(
                         child: Text(widget.name.toString(),
                              // 'Production Team',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                       ) : Text(
                            'Production Team',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('3 participants'),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.videocam,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.call_rounded,
                        color: Colors.grey[600],
                        size: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '...',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Container(
                    // height:450,
                    height: MediaQuery.of(context).size.height - 115,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200)),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200)),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.attach_file,
                            size: 20,
                            color: Colors.grey[600],
                          ),
                          Icon(Icons.photo_size_select_actual_rounded,
                              size: 20, color: Colors.grey[600]),
                          Icon(
                            Icons.mic_none_sharp,
                            size: 20,
                            color: Colors.grey[600],
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 0.0, bottom: 25),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  child: TextFormField(
                                    cursorColor: Colors.pink[300],
                                    style: TextStyle(fontSize: 12),
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.emoji_emotions,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                        filled: true,
                                        border: InputBorder.none,
                                        fillColor: Colors.grey.shade200,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelText: 'Type a message',
                                        labelStyle: TextStyle(fontSize: 12)
                                        // hintText: 'Type a message',hintStyle: TextStyle(fontSize: 12,color: Colors.black)
                                        ),
                                    textAlignVertical: TextAlignVertical.top,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.send_rounded,
                            size: 20,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
