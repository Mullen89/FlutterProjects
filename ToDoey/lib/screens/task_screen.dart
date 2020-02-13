import 'package:flutter/material.dart';
import 'package:todo_flutter/models/database_handler.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/widgets/tasts_list.dart';
import 'add_task.dart';
import 'package:todo_flutter/models/tasks.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
    updateTaskList();
  }

  Future<void> updateTaskList() async {
    List<Task> list = await DatabaseHandler.instance.getTaskList();
    setState(() {
      for (Task item in list) {
        if (item.id == 0) {
          Provider.of<TaskData>(context, listen: false).addTask(item.name, 0);
        } else {
          Provider.of<TaskData>(context, listen: false).addTask(item.name, 1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,

            /**
             * "SingleChildScrollView plus isScrollControlled helps keep keyboard
             * directly under ModalBottomSheet screen. Useful for smaller screens.
             */
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
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
                    'ToDoey',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).counter} Tasks Remain',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 17.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                ),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
