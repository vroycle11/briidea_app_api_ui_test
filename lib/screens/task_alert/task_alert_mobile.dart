import 'package:flutter/material.dart';

class TaskPageMobile extends StatefulWidget {
  const TaskPageMobile({super.key});

  @override
  State<TaskPageMobile> createState() => _TaskPageMobileState();
}

class _TaskPageMobileState extends State<TaskPageMobile> {
  @override
  Widget build(BuildContext context) {
    List<String> task = ['Work on gmail', 'Visit Member', 'Make Appointment'];
     List<String> alert = ['Interest rate changes to 5%', 'Fill the form of onboarding ', 
     //'Check the leave Count of month',
     
     'New schemes Closed'];
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
              Container(
                height: 220,
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
                            title: Transform.translate(
    offset: Offset(-16, 0),
                              child: Text(
                                task[index],style: TextStyle(fontSize: 12)
                              ),
                            ),
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
                              title: Transform.translate(
    offset: Offset(-10, 0),
                                child: Text(
                                  alert[index],style: TextStyle(fontSize: 12),
                                ),
                              ),
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
  }
}
