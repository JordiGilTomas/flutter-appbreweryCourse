import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];

  void addTask(String task) {
    if (task != null) {
      _tasks.add(Task(name: task));
      notifyListeners();
    }
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  String tasksToDo() {
    int tasksToDo = _tasks.fold(
        0, (tasksToDo, task) => !task.isDone ? tasksToDo += 1 : tasksToDo);

    if (tasksToDo == 0) return 'No Tasks to do';
    if (tasksToDo == 1) return '$tasksToDo Task';
    return '$tasksToDo Tasks';
  }

  void changeTaskStatus(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
