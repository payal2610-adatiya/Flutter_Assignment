import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._init();
  static Database? _database;

  DbHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb("notes.db");
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    ''');
  }

  /// Insert Note
  Future<int> insertNote(Map<String, dynamic> note) async {
    final db = await instance.database;
    return await db.insert("notes", note);
  }

  /// Get Notes
  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await instance.database;
    return await db.query("notes", orderBy: "id DESC");
  }

  /// Delete Note
  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete("notes", where: "id = ?", whereArgs: [id]);
  }
}
