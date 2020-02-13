import 'package:flutter/material.dart';

import 'database_handler.dart';
import 'task_model.dart';

class ItemTask extends StatelessWidget {
  final Task task;
  final Function checkboxCallback;
  ItemTask({this.task, this.checkboxCallback});

  _deleteTask() {
    DatabaseHandler.instance.deleteTask(task.id);
    checkboxCallback;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onLongPress: _deleteTask,
          title: Text(
            task.title,
            style: TextStyle(
              fontSize: 25.0,
              decoration: task.status == 0
                  ? TextDecoration.none
                  : TextDecoration.lineThrough,
            ),
          ),
          trailing: Checkbox(
            value: task.status == 1 ? true : false,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              task.status == 1 ? task.status = 0 : task.status = 1;
              task.status == 0 ? false : true;
              DatabaseHandler.instance.updateTask(task);
              checkboxCallback;
            },
          ),
        ),
        Divider(
          thickness: 2.0,
          color: Colors.grey[350],
        ),
      ],
    );
  }
}
