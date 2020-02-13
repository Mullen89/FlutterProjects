import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longpressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longpressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.green,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
