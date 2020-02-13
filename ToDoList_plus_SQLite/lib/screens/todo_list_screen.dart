import 'package:flutter/material.dart';
import 'package:sql_todo/models/database_handler.dart';
import 'package:sql_todo/models/item_task_model.dart';
import 'package:sql_todo/models/task_model.dart';
import 'package:sql_todo/screens/add_task_screen.dart';
import 'dart:async';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  Future<List<Task>> _taskList;

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    Timer(
      Duration(milliseconds: 50),
      () {
        setState(() {
          _taskList = DatabaseHandler.instance.getTaskList();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
//    int completedTaskCount = 0;
//    int snapshotLength = 0;

    return Scaffold(
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddTaskScreen(_updateTaskList),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.green,
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.green,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Simply To Do',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
//                  Text(
//                    '$completedTaskCount of $snapshotLength Tasks Remain',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 15.0,
//                    ),
//                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                ),
                child: FutureBuilder(
                  future: _taskList,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

//                    snapshotLength = snapshot.data.length;
//                    completedTaskCount = snapshot.data
//                        .where((Task task) => task.status == 1)
//                        .toList()
//                        .length;

                    return ListView.builder(
                      itemCount: 1 + snapshot.data.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SizedBox(height: 10.0, width: 10.0);
                        }
                        return ItemTask(
                          task: snapshot.data[index - 1],
                          checkboxCallback: _updateTaskList(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
