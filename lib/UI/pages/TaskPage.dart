import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TaskPage extends StatelessWidget {
  const TaskPage({super.key, required this.title});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(title),
          MaterialButton(onPressed: () {
            Navigator.of(context).pop();
          })
        ],
      )
    );
  }


}