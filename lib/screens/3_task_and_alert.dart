import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
              flex: 2,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border.symmetric(
                        vertical: BorderSide.none,
                      )),
                  height: MediaQuery.of(context).size.height,
                  child: Text('title')),
            );
  }
}