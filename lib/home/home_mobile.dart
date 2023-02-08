import 'package:briidea_app_api_ui_test/models/user.model.dart';
import 'package:briidea_app_api_ui_test/provider/group_provider.dart';
import 'package:briidea_app_api_ui_test/provider/message_provider.dart';
import 'package:briidea_app_api_ui_test/screens/chat_screen/chat_screen_mobile.dart';
import 'package:briidea_app_api_ui_test/screens/message_and_group/message_and%20_group.dart';
import 'package:briidea_app_api_ui_test/screens/chat_screen/chat_screen.dart';
import 'package:briidea_app_api_ui_test/screens/task_alert/task_alert_mobile.dart';
import 'package:briidea_app_api_ui_test/screens/task_alert/task_and_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key, required this.title});

  final String title;

  

  @override
  Widget build(BuildContext context) {
    final userMdl = Provider.of<UserDataProvider>(context);
    final groupMdl = Provider.of<GroupDataProvider>(context);

     String? name =
        ModalRoute.of(context)!.settings.arguments.toString();
      //  String? groupName = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      
      // appBar: AppBar(

      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: 1028,
          height: MediaQuery.of(context).size.height * 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // DM_And_Groups(),
               ChatScreenMobile(name),
              //const TaskPageMobile(),
             
            ],
          ),
        ),
      ),
    );
  }
}
