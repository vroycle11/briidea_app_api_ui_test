// import 'dart:ffi';

import 'package:briidea_app_api_ui_test/home/home_mobile.dart';
import 'package:briidea_app_api_ui_test/home/home_tab.dart';
import 'package:briidea_app_api_ui_test/provider/group_provider.dart';
import 'package:briidea_app_api_ui_test/provider/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ChatScreenMobile extends StatefulWidget {
   ChatScreenMobile(this.name,  {super.key});

   String? name;

   

  @override
  State<ChatScreenMobile> createState() => _ChatScreenMobileState();

  
}

class _ChatScreenMobileState extends State<ChatScreenMobile> {
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

     List<String> task = ['Work on gmail', 'Visit Member', 'Make Appointment'];
       List<String> alert = ['Interest rate changes to 5%', 'Fill the form of onboarding ', 'Check the leave Count of month','New schemes Closed'];

    return Expanded(
      flex: 3,
      child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                  vertical:
                      BorderSide(width: 0.1, color: Colors.grey.shade200))),
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0),
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
                      IconButton(icon:Icon(Icons.window), onPressed: () { 

                        showModalBottomSheet(
                          isScrollControlled: true,
                          
    context: context,
    builder: (context) {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){

                        Navigator.pop(context);
                      }, icon:  Icon(Icons.close))),
                    Padding(
                      padding: const EdgeInsets.only(left:30.0,right: 0,top:0,bottom: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Briidea',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                        ),
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
                      width: 345,
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
                                                HomePageMobile(title: 'Briidea',),
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
                      padding: EdgeInsets.only(left: 0.0, top: 20, bottom: 15),
                      child: Text('Commute/Group',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
            
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: SizedBox(
                        height: 100,
                        width: 345,
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
                                                HomePageMobile(title: 'Briidea',),
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
    });
                       },),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 17,
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
                              
                              style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 12,),
                            ),
                       ) : Text(
                            'Production Team',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('3 participants',style: TextStyle(  fontSize: 12,),),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.videocam,
                          size: 17,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.call_rounded,
                        color: Colors.grey[600],
                        size: 17,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                   
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '...',
                            style: TextStyle(fontSize: 12.0,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                            
                        ],
                      ),
                       IconButton(onPressed: (){
showModalBottomSheet(
                          isScrollControlled: true,
                          
    context: context,
    builder: (context) {
    return Expanded(
          flex: 2,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border.symmetric(
                    vertical: BorderSide.none,
                  )),
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                 Align(
                      
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){

                        Navigator.pop(context);
                      }, icon:  Icon(Icons.close))),
                Container(
                  height: 215,
                  child: ExpansionTile(
                    iconColor: Colors.grey,
                    initiallyExpanded: true,
                    leading: Text(
                      "Task",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    title: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${task.length} Task',
                          style: TextStyle(color: Colors.grey,fontSize: 12.0,),
                        )),
                    children: <Widget>[
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              dense: true,
                              // isThreeLine: true,
                              minVerticalPadding: 0,
                              leading: Icon(
                                Icons.layers,
                                color: Colors.black,
                              ),
                              title:
      //                          Transform.translate(
      // offset: Offset(-16, 0),
      //                           child:
                                 Text(
                                  task[index],style: TextStyle(fontSize: 12)
                                ),
                              // ),
                              trailing: Transform.translate(
      offset: Offset(-16, 0),
                                child: Text(
                                  '...',
                                ),
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.all(11),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.pink[300],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'view all',
                              style: TextStyle(
                                color: Colors.pink[300],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Divider(color: Colors.grey,),
                ExpansionTile(
                  initiallyExpanded: true,
                  iconColor: Colors.grey,
                  title: Text(
                    "Alert",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  // title: Align(
                  //     alignment: Alignment.centerRight,
                  //     child: Text(
                  //       '${task.length} Task',
                  //       style: TextStyle(color: Colors.grey),
                  //     )
    
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount:  alert.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                                Divider(),
                              ListTile(
                                tileColor: Colors.black,
                                dense: true,
                                //  minLeadingWidth : 35,
                                //  horizontalTitleGap: 7,
                                 visualDensity: VisualDensity.compact,
                                minVerticalPadding: 0,
                                leading: Icon(
                                  Icons.info,
                                  color: Colors.black,
                                ),
                                title: 
      //                           Transform.translate(
      // offset: Offset(-10, 0),
      //                             child: 
                                  Text(
                                    alert[index],style: TextStyle(fontSize: 12),
                                  ),
                                // ),
                                trailing: Transform.translate(
      offset: Offset(-6, 0),
                                  child: Text(
                                    '...',
                                  ),
                                ),
                              ),
                            
                            ],
                          );
                          
                        }),
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.pink[300],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'view all',
                            style: TextStyle(
                              color: Colors.pink[300],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ])));
  });

                       }, 
                       icon: Icon(Icons.assignment,color: Colors.grey[800],)),
                       
                    ]),
                  ),
                  Container(
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
                            size: 17,
                            color: Colors.grey[600],
                          ),
                          Icon(Icons.photo_size_select_actual_rounded,
                              size: 17, color: Colors.grey[600]),
                          Icon(
                            Icons.mic_none_sharp,
                            size: 17,
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
                                     color: Colors.grey[600],
                                          size: 17,
                                        ),
                                        filled: true,
                                        border: InputBorder.none,
                                        fillColor: Colors.grey.shade200,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelText: 'Type a message',
                                        labelStyle: TextStyle(fontSize: 10)
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
                            size: 17,
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
