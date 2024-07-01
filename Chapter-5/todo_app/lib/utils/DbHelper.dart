import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/todos.dart';

class DbHelper {
  static Database? _db;
  static int get _version => 1;
  static const String _todoTable = 'todo';

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await init();
    return _db;
  }

  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}todo.db';
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_todoTable(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      judul TEXT,
      deskripsi TEXT,
      isDone INTEGER
    )
  ''');
  }

  Future<void> insertTodo(Todo todo) async {
    var database = await db;
    await database!.insert(_todoTable, todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getTodos() async {
    var database = await db;
    List<Map<String, dynamic>> todos = await database!.query(_todoTable);
    return List.generate(todos.length, (index) {
      return Todo.fromJson(todos[index]);
    });
  }

  Future<void> update(Todo todo) async {
    var database = await db;
    await database!.update(_todoTable, todo.toJson(),
        where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<void> delete(int id) async {
    var database = await db;
    await database!.delete(_todoTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAll() async {
    var database = await db;
    await database!.delete(_todoTable);
  }

  Future<void> deleteDone() async {
    var database = await db;
    await database!.delete(_todoTable, where: 'isDone = ?', whereArgs: [1]);
  }

  Future<void> isChecked(int id) async {
    var database = await db;
    await database!
        .update(_todoTable, {'isDone': 1}, where: 'id = ?', whereArgs: [id]);
  }
}
