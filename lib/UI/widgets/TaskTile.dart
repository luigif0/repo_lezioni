import 'package:esempiotodo/model/objects/Task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {
  TaskTile({super.key, required this.task});

  Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(task.title),
      ),
    );
  }
}