import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2data = await task2();
  task3(task2data);
}

void task1() {
  String result = "Task 1 data";
  print('Task 1 complete');
}

Future task2() async {
  String result;
  Duration d = Duration(seconds: 2);
  await Future.delayed(d, () {
    result = "Task 2 data";
    print('Task 2 complete');
  });
  return result;
  // sleep(d);
}

void task3(String task2Data) {
  String result = "Task 3 data";
  print('Task 3 complete with $task2Data');
}
