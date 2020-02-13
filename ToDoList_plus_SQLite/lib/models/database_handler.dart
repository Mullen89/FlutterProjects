import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'task_model.dart';

class DatabaseHandler {
  static final DatabaseHandler instance = DatabaseHandler._instance();
  static Database _db;

  DatabaseHandler._instance();

  // Task Table
  // ID | Item | Status
  // 0  |  ''  |   0
  // 2  |  ''  |   0
  // 3  |  ''  |   1
  // 4  |  ''  |   1
  // *status = 0 if unchecked, 1 if checked

  String taskTable = 'task_table';
  String colID = 'id';
  String colItem = 'item';
  String colStatus = 'status';

  Future<Database> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/todoey_db';
    final todoListDB =
        await openDatabase(path, version: 1, onCreate: _createDB);
    return todoListDB;
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $taskTable('
      '$colID INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$colItem TEXT,'
      '$colStatus INTEGER)',
    );
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(taskTable);
    return result;
  }

  Future<List<Task>> getTaskList() async {
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList();
    final List<Task> taskList = [];
    taskMapList.forEach((taskMap) {
      taskList.add(Task.fromMap(taskMap));
    });
    return taskList;
  }

  Future<int> insertTask(Task task) async {
    Database db = await this.db;
    final int result = await db.insert(taskTable, task.toMap());
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database db = await this.db;
    final int result = await db.update(taskTable, task.toMap(),
        where: '$colID = ?', whereArgs: [task.id]);
    return result;
  }

  Future<int> deleteTask(int id) async {
    Database db = await this.db;
    final int result =
        await db.delete(taskTable, where: '$colID = ?', whereArgs: [id]);
    return result;
  }
}
