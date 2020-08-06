import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:todoey_flutter/widgets/task_title.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<Tasks>(
        builder: (context, tasks, child) => ListView.builder(
            itemBuilder: (context, index) => TaskTile(
                  title: tasks.getTasks()[index].name,
                  isChecked: tasks.getTasks()[index].isDone,
                  index: index,
                ),
            itemCount: tasks.getTasks().length),
      );
}
