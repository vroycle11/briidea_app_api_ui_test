
import 'package:briidea_app_api_ui_test/home/home_desktop.dart';
import 'package:briidea_app_api_ui_test/home/home_mobile.dart';
import 'package:briidea_app_api_ui_test/home/home_tab.dart';
import 'package:briidea_app_api_ui_test/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  final String title;

  const HomeLayout({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

 
  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(builder: (context, constraints) {
      // For Mobile
      if (constraints.maxWidth <= 425) {
        return HomePageMobile(
          
          title: 'Briidea',
        );
        // For Tablet
      } else if (constraints.maxWidth <= 768) {
        return HomePageTab(
          title: 'Briidea',
     
        );
      
      } else {
        //For Desktop
        return HomePageDesktop(
          title: 'briidea',
  
        );
      }
    });
  }
}
