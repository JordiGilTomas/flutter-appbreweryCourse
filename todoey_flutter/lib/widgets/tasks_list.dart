import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:todoey_flutter/widgets/task_title.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<Tasks>(
        builder: (context, taskList, child) => ListView.builder(
            itemBuilder: (context, index) => TaskTile(
                  title: taskList.tasks[index].name,
                  isChecked: taskList.tasks[index].isDone,
                  toogleStatus: () => taskList.changeTaskStatus(index),
                  deleteTask: () => taskList.deleteTask(index),
                ),
            itemCount: taskList.tasks.length),
      );
}
