import 'package:flutter/material.dart';
import 'package:sql_todo/models/database_handler.dart';
import 'package:sql_todo/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  final Function update;
  AddTaskScreen(this.update);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 90.0,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: textController,
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: 'Enter item',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (input) {
                            return input.trim().isEmpty
                                ? 'Please enter a task title'
                                : null;
                          },
                          onSaved: (input) {
                            return _title = input;
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 50.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                        ),
                        child: FlatButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              //print(_title);

                              Task task = Task(title: _title, status: 0);
                              DatabaseHandler.instance.insertTask(task);

                              textController.clear();
                              FocusScope.of(context).unfocus();

                              widget.update();
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
