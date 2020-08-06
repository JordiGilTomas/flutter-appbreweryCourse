import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.title, this.index});

  final bool isChecked;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, taskList, child) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
        title: Text(
          title,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: (_) => taskList.changeTaskStatus(index)),
      ),
    );
  }
}
