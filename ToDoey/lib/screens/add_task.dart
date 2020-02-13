import 'package:flutter/material.dart';
import 'package:todo_flutter/models/tasks.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding:
            EdgeInsets.only(top: 10.0, left: 60.0, right: 60.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.green,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.green,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle, 0);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
