
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  /// Initialize database (singleton)
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  static Future<Database> _initDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT)",
        );
      },
    );
  }

  /// Get all tasks
  static Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    return await db.query("tasks");
  }

  /// Insert task
  static Future<void> insertTask(String title) async {
    final db = await database;
    await db.insert("tasks", {"title": title});
  }

  /// Update task
  static Future<void> updateTask(int id, String newTitle) async {
    final db = await database;
    await db.update(
      "tasks",
      {"title": newTitle},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /// Delete task
  static Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete("tasks", where: "id = ?", whereArgs: [id]);
  }
}
