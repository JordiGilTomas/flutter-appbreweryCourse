import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_title.dart';

class TaskList extends StatefulWidget {
  TaskList({this.tasks, this.onChange});
  final List<Task> tasks;
  final Function onChange;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) => ListView.builder(
      itemBuilder: (context, index) => TaskTile(
          title: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (bool checkboxState) {
            widget.onChange();
            setState(() => widget.tasks[index].toogleDone());
          }),
      itemCount: widget.tasks.length);
}
