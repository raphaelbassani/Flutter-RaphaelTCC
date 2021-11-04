import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:raphael_tcc/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper? _dbHelper;
  static Database? _database;

  String taskTable = 'tasks';
  String colId = 'id';
  String colTask = 'task';

  DBHelper._createInstance();

  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createInstance();
    }
    return _dbHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'Tasks.db';

    var taskDataBase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return taskDataBase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $taskTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colTask TEXT)');
  }

  Future<int> createTask(Task task) async {
    Database db = await this.database;
    var result = await db.insert(taskTable, task.toMap());
    return result;
  }

  Future<List<Task>> getTasks() async {
    Database db = await this.database;
    var result = await db.query(taskTable);
    List<Task> tasks =
        result.isNotEmpty ? result.map((c) => Task.fromMap(c)).toList() : [];
    return tasks;
  }

  Future<int> updateTask(Task tasks) async {
    var db = await this.database;
    var result = await db.update(taskTable, tasks.toMap(),
        where: '$colId = ?', whereArgs: [tasks.id]);
    return result;
  }

  Future<int> deleteTask(int id) async {
    var db = await this.database;
    int result =
        await db.delete(taskTable, where: "$colId = ?", whereArgs: [id]);
    return result;
  }

  Future close() async {
    Database db = await this.database;
    db.close();
  }
}
