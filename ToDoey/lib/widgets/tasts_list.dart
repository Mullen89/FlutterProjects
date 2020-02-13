import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final tempTask = taskData.tasks[index];
          return TaskTile(
            taskTitle: tempTask.name,
            isChecked: tempTask.isDone,
            checkboxCallback: (value) {
              taskData.updateTask(tempTask);
            },
            longpressCallback: () {
              taskData.deleteTask(tempTask);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
