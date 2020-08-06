import 'package:todoey_flutter/models/task.dart';

class Tasks {
  List<Task> tasks = [];

  void addTask(String task) {
    if (task != null) tasks.add(Task(name: task));
  }

  List<Task> getTasks() => tasks;

  String tasksToDo() {
    int tasksToDo = tasks.fold(
        0, (tasksToDo, task) => !task.isDone ? tasksToDo += 1 : tasksToDo);

    if (tasksToDo == 0) return 'No Tasks to do';
    if (tasksToDo == 1) return '$tasksToDo Task';
    return '$tasksToDo Tasks';
  }
}
