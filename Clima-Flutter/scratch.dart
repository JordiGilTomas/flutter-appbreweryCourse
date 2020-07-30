void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result.toString());
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete: $result');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;

  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String taks2Data) {
  String result = 'task 3 data';
  print('$result complete with $taks2Data');
}
