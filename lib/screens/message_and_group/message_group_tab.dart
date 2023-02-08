import 'dart:convert';

import 'package:briidea_app_api_ui_test/home/home_desktop.dart';
import 'package:briidea_app_api_ui_test/home/home_tab.dart';
import 'package:briidea_app_api_ui_test/models/group.model.dart';
import 'package:briidea_app_api_ui_test/models/user.model.dart';
import 'package:briidea_app_api_ui_test/provider/group_provider.dart';
import 'package:briidea_app_api_ui_test/provider/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class DM_And_Groups_Tab extends StatefulWidget {
  const DM_And_Groups_Tab( {super.key});

  @override
  State<DM_And_Groups_Tab> createState() => _DM_And_Groups_TabState();
}

class _DM_And_Groups_TabState extends State<DM_And_Groups_Tab> {
  // late Future<User> user ;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserDataProvider>(context, listen: false);
    final groupProvider =
        Provider.of<GroupDataProvider>(context, listen: false);
    userProvider.getUserData(context);
    groupProvider.getGroupData(context);
  }

  @override
  Widget build(BuildContext context) {
    final userMdl = Provider.of<UserDataProvider>(context);
    final groupMdl = Provider.of<GroupDataProvider>(context);
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
        child: userMdl.loading
            ? Container(
                width: 2,
                child: LinearProgressIndicator(),
              )
            : Container(
             
              height: MediaQuery.of(context).size.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:30.0,right: 0,top:30,bottom: 30),
                      child: const Text(
                        'Briidea',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        // height: 40,
                        child: Theme(
                          data: Theme.of(context).copyWith(),
                          child: TextField(
                            cursorColor: Colors.pink[300],
                            autofocus: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey[100],
                              // focusColor: Colors.black,
                              hintText: 'Search',
            
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0, top: 20, bottom: 15),
                      child: Text('Direct Message',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    // SizedBox(
                    //   height: 100,
                    //   width: 300,
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.vertical,
                    //     itemBuilder: (context, index) {
                    //       return ListTile(
                    //         onTap: () {},
                    //         //  onFocusChange: (value) {
            
                    //         //  },
                    //         leading: CircleAvatar(
                    //           // minRadius:15,
                    //           // maxRadius:16,
            
                    //           radius: 15,
                    //           backgroundColor: Colors.pink[300],
                    //         ),
                    //         // Icon(Icons.account_circle_rounded),
                    //         title: Column(
                    //           //mainAxisAlignment: MainAxisAlignment.start,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(postMdl.post.data![index].firstname,
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold)),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Text(postMdl.post.data![index].message),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //         // subtitle: Text(postMdl.post.data![index].message),
                    //         // ignore: prefer_const_constructors
                    //         trailing: Column(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               postMdl.post.data![index].messageTime
                    //                   .toString()
                    //                   .substring(11, 16),
                    //               style: TextStyle(fontSize: 10),
                    //             ),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Transform(
                    //               transform: new Matrix4.identity()..scale(0.5),
                    //               child: Chip(
                    //                   visualDensity: VisualDensity.compact,
                    //                   backgroundColor: Colors.pink[300],
                    //                   //visualDensity: VisualDensity(horizontal:4, vertical: -4),
                    //                   materialTapTargetSize:
                    //                       MaterialTapTargetSize.shrinkWrap,
                    //                   label: const Text('1',
                    //                       overflow: TextOverflow.ellipsis,
                    //                       style: TextStyle(
                    //                           color: Colors.black,
                    //                           fontSize: 12))),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //     itemCount: postMdl.post.newChat!.length,
                    //   ),
                    // ),
                    SizedBox(
                      height: 130,
                      width: 245,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            color:
                                // Colors.blue[50],
                                Colors.blueGrey[50],
                            child: ListTile(
                              // hoverColor: Colors.red,
                              // tileColor: Colors.red,
            
                              onTap: () {
                               String? name = userMdl.post.newChat![index].firstname;
                                 Navigator.push(

                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePageTab(title: 'Briidea',),
                                            // Pass the arguments as part of the RouteSettings. The
                                            // DetailScreen reads the arguments from these settings.
                                            settings: RouteSettings(
                                              arguments: name,
                                            ),
                                          ),
                                        );
                              },
                              //  onFocusChange: (value) {
            
                              //  },
                              leading: CircleAvatar(
                                // minRadius:15,
                                // maxRadius:16,
            
                                radius: 18,
                                backgroundColor: Colors.pink[300],
                              ),
                              // Icon(Icons.account_circle_rounded),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userMdl.post.newChat![index].firstname,
                                      style:
                                          TextStyle(fontSize: 15 ,fontWeight: FontWeight.w700)),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  Row(
                                    children: [
                                      index < 2
                                          ? Text(
                                              userMdl.post.data![index].message,style: TextStyle(fontSize: 14),)
                                          : Text(''),
                                    ],
                                  ),
                                ],
                              ),
                              // subtitle: Text(postMdl.post.data![index].message),
                              // ignore: prefer_const_constructors
                              trailing: SizedBox(
                                width: 30,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    index < 2
                                        ? Text(
                                            userMdl.post.data![index].messageTime
                                                .toString()
                                                .substring(11, 16),
                                            style: TextStyle(fontSize: 10),
                                          )
                                        : Text(''),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    index < 2
                                        ? Transform(
                                            transform: new Matrix4.identity()
                                              ..scale(0.5),
                                            child: Chip(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                backgroundColor: Colors.pink[300],
                                                //visualDensity: VisualDensity(horizontal:4, vertical: -4),
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                label: const Text('1',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12))),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: userMdl.post.newChat!.length,
                      ),
                    ),
            
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 20, bottom: 15),
                      child: Text('Commute/Group',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
            
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: SizedBox(
                        height: 100,
                        width: 230,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container(
                              
                              color: Colors.blueGrey[50],
                              child: ListTile(
                                  onTap: () {

                                     String? groupName = groupMdl
                                          .group.newGroup![index].chatGroupName;
                                 Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePageTab(title: 'Briidea',),
                                            // Pass the arguments as part of the RouteSettings. The
                                            // DetailScreen reads the arguments from these settings.
                                            settings: RouteSettings(
                                              arguments: groupName,
                                            ),
                                          ),
                                        );

                                  },
                                  leading: Text(
                                      groupMdl
                                          .group.newGroup![index].chatGroupName,
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold)),
            
                                  // subtitle: Text(postMdl.post.data![index].message),
                                  // ignore: prefer_const_constructors
                                  trailing: Transform(
                                    alignment: Alignment.centerRight,
                                    
                                      transform: new Matrix4.identity()
                                        ..scale(0.5),
                                      child: Chip(
                                          visualDensity: VisualDensity.compact,
                                          backgroundColor: Colors.pink[300],
                                          //visualDensity: VisualDensity(horizontal:4, vertical: -4),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          label: const Text('1',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))))),
                            );
                          },
                          itemCount: groupMdl.group.newGroup!.length,
                        ),
                      ),
                    ),
            
                  
            
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, top: 20, bottom: 0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage:  AssetImage('profile.jpg'),
            
                              ),
                              SizedBox(width: 5,),
                              Text("Dashboard",style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: const [
                              SizedBox(
                                
                                width:10),
                              Icon(Icons.settings),
                              SizedBox(width: 5,),
                             Text('Setting',style :TextStyle(fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
            ),
      ),
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
