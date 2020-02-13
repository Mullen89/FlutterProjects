import 'package:flutter/foundation.dart';
import 'package:todo_flutter/models/tasks.dart';

class TaskData extends ChangeNotifier {
  final List<Task> tasks = [];
  int count = 0;

  int get taskCount {
    return tasks.length;
  }

  int get counter {
    return count;
  }

  void addTask(String newTaskTitle, int chk) {
    bool check;
    if (newTaskTitle != null) {
      chk == 0 ? check = false : check = true;
      final task =
          Task(id: tasks.length + 1, name: newTaskTitle, isDone: check);
      tasks.add(task);
      count++;
      notifyListeners();
    }
  }

  void updateTask(Task task) {
    task.toggleDone();
    task.isDone == true ? count-- : count++;
    notifyListeners();
  }

  void deleteTask(Task task) {
    if (task.isDone == true) {
      tasks.remove(task);
    } else {
      count--;
      tasks.remove(task);
    }
    notifyListeners();
  }
}
