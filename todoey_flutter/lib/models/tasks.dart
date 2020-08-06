import 'package:todoey_flutter/models/task.dart';

class Tasks {
  List<Task> tasks = [];

  void addTask(String task) => tasks.add(Task(name: task));

  List<Task> getTasks() => tasks;
}
