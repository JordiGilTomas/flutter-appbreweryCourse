import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String task) {
    if (task != null) tasks.add(Task(name: task));
    notifyListeners();
  }

  List<Task> getTasks() => tasks;

  String tasksToDo() {
    int tasksToDo = tasks.fold(
        0, (tasksToDo, task) => !task.isDone ? tasksToDo += 1 : tasksToDo);

    if (tasksToDo == 0) return 'No Tasks to do';
    if (tasksToDo == 1) return '$tasksToDo Task';
    return '$tasksToDo Tasks';
  }

  void changeTaskStatus(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }
}
