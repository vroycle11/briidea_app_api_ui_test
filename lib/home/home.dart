import 'package:briidea_app_api_ui_test/models/user.model.dart';
import 'package:briidea_app_api_ui_test/screens/1_message_and%20_group.dart';
import 'package:briidea_app_api_ui_test/screens/2_chat_screen.dart';
import 'package:briidea_app_api_ui_test/screens/3_task_and_alert.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //   title: Text(widget.title),
      // ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        child: Row(
          children:  [
           DM_And_Groups(),
         const  ChatScreen(),
         const   TaskPage(),
          ],
        ),
      ),
    );
  }
}
