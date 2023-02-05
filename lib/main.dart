import 'package:briidea_app_api_ui_test/home/home.dart';
import 'package:briidea_app_api_ui_test/provider/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     MultiProvider(
      providers:
      [ ChangeNotifierProvider<PostDataProvider>(create: (_) => PostDataProvider())
      ,
      ],
      child: MyApp(),
    ),
   );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Briidea Chat App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Briidea Chat App',),
    );
  }
}


