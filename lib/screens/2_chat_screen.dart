import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              flex: 4,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.symmetric(
                          vertical: BorderSide(color: Colors.grey.shade200))),
                  child: Text('title')),
            );
  }
}