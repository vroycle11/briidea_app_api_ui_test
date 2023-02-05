import 'dart:convert';

import 'package:briidea_app_api_ui_test/models/group.model.dart';
import 'package:briidea_app_api_ui_test/models/user.model.dart';
import 'package:briidea_app_api_ui_test/provider/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class DM_And_Groups extends StatefulWidget {
  DM_And_Groups({super.key});

  @override
  State<DM_And_Groups> createState() => _DM_And_GroupsState();
}

class _DM_And_GroupsState extends State<DM_And_Groups> {
  // late Future<User> user ;

  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<PostDataProvider>(context, listen: false);
    postMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<PostDataProvider>(context);
    // List<User>? u;
    return Expanded(
      flex: 2,
      child:
          // Container(
          //     decoration: const BoxDecoration(
          //         color: Colors.white,
          //         border: Border.symmetric(
          //           vertical: BorderSide.none,
          //         )),
          //     height: MediaQuery.of(context).size.height,
          //     child: Padding(
          //       padding:  EdgeInsets.all(10.0),
          //       child: Column(
          //         children: [
          //           Text('Briidea'),
          //         Text(postMdl.post.data![0].firstname),
          Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(
              vertical: BorderSide.none,
            )),
        //height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(0),
        child: postMdl.loading
            ? Container(
                width: 2,
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: const Text(
                      'Briidea',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                    ),
                  ),
                  Padding(
                   padding: const EdgeInsets.only(left:15.0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[100],
                          // focusColor: Colors.black,
                          hintText: 'Search',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search_rounded),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:25.0,top: 20,bottom: 20),
                    child: Text('Direct Message',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ListView.builder(
                      shrinkWrap: true,
                      
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListTile(
                         onTap: (){},
                        //  onFocusChange: (value) {
                           
                        //  },
                          leading: CircleAvatar(
                            // minRadius:15,
                            // maxRadius:16,
                        
                            radius: 15,
                            backgroundColor: Colors.pink[300],) ,
                         // Icon(Icons.account_circle_rounded),
                          title: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(postMdl.post.data![index].firstname,style: TextStyle(fontWeight: FontWeight.bold)),
                               SizedBox(height: 5,),
                               Row(
                                 children: [
                                   Text(postMdl.post.data![index].message),
                                 ],
                               ),
                            ],
                          ),
                          // subtitle: Text(postMdl.post.data![index].message),
                          // ignore: prefer_const_constructors
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(postMdl.post.data![index].messageTime.toString().substring(11,16),style: TextStyle(fontSize: 10),),
                              SizedBox(height: 5,),
                              Transform(
                                  transform: new Matrix4.identity()..scale(0.5),
                                child: Chip(
                                  visualDensity: VisualDensity.compact,
                                  backgroundColor: Colors.pink[300],
                                 //visualDensity: VisualDensity(horizontal:4, vertical: -4),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    label: const Text('1', overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.black,fontSize: 12))),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: postMdl.post.data!.length,
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 40, bottom: 20),
                  //   child: Text(
                  //     postMdl.post.data![0].lastname ,
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  //   ),
                  // ),
                  // Container(
                  //   child: Text(postMdl.post.data![0].companyName),
                  // )
                ],
              ),
      ),

      //   ElevatedButton(onPressed: (){

      //     // fetchUsers(context);

      //   }, child: Text('call'))
      // ],
      //   ),

      // )),
    );
  }
}

Future<User> fetchUsers(BuildContext context) async {
  var url = Uri.parse(
      'https://briidea.ensurechat.com/api/UserChat/showUserListforChat/');
  final response = await http.get(url);
  // print(response.body);

  if (response.statusCode == 200) {
    // If the server returns an OK response, then parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If the response was umexpected, throw an error.
    throw Exception('Failed to load post');
  }
}


Future<Group> fetchGroups(BuildContext context) async {
  var url = Uri.parse(
      'https://briidea.ensurechat.com/api/ChatGroup/showGroupListforChat/');
  final response = await http.get(url);
  print(response.body);

  if (response.statusCode == 200) {
    // If the server returns an OK response, then parse the JSON.
    return Group.fromJson(json.decode(response.body));
  } else {
    // If the response was umexpected, throw an error.
    throw Exception('Failed to load post');
  }
}

// List<User> parseResponse(String responseBody) {

// }
