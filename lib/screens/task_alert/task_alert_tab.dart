import 'package:flutter/material.dart';

class TaskPageTab extends StatefulWidget {
  const TaskPageTab({super.key});

  @override
  State<TaskPageTab> createState() => _TaskPageTabState();
}

class _TaskPageTabState extends State<TaskPageTab> {
  @override
  Widget build(BuildContext context) {
    List<String> task = ['Work on gmail', 'Visit Member', 'Make Appointment'];
     List<String> alert = ['Interest rate changes to 5%', 'Fill the form of onboarding ', 'Check the leave Count of month','New schemes Closed'];
    return Flexible(
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
                height: 248,
                child: ExpansionTile(
                  iconColor: Colors.grey,
                  initiallyExpanded: true,
                  leading: Text(
                    "Task",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${task.length} Task',
                        style: TextStyle(color: Colors.grey),
                      )),
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                            minVerticalPadding: 0,
                            leading: Icon(
                              Icons.layers,
                              color: Colors.black,
                            ),
                            title: Text(
                              task[index],style: TextStyle(fontSize: 14),
                            ),
                            trailing: Text(
                              '...',
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
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
                      fontSize: 18.0,
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
                        return ListTile(
                          minVerticalPadding: 0,
                          leading: Icon(
                            Icons.info,
                            color: Colors.black,
                          ),
                          title: Text(
                            alert[index],style: TextStyle(fontSize: 14),
                          ),
                          trailing: Text(
                            '...',
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
