import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  Database? database;
  List<Map<String, dynamic>> tasks = [];
  final TextEditingController controller = TextEditingController();
  int? editingId;

  @override
  void initState() {
    super.initState();
    initDb();
  }

  /// Initialize Database
  Future<void> initDb() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT)",
        );
      },
      version: 1,
    );
    loadTasks();
  }

  /// Load tasks from DB
  Future<void> loadTasks() async {
    final data = await database!.query("tasks");
    setState(() {
      tasks = data;
    });
  }

  /// Add new task
  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) return;
    await database!.insert("tasks", {"title": title});
    controller.clear();
    loadTasks();
  }

  Future<void> updateTask(int id, String newTitle) async {
    if (newTitle.trim().isEmpty) return;
    await database!.update(
      "tasks",
      {"title": newTitle},
      where: "id = ?",
      whereArgs: [id],
    );
    controller.clear();
    editingId = null;
    loadTasks();
  }

  /// Delete task
  Future<void> deleteTask(int id) async {
    await database!.delete("tasks", where: "id = ?", whereArgs: [id]);
    loadTasks();
  }

  /// Start editing
  void startEditing(Map<String, dynamic> task) {
    controller.text = task["title"];
    setState(() {
      editingId = task["id"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple To-Do")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: editingId == null
                              ? "Enter new task"
                              : "Edit task",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (editingId == null) {
                          addTask(controller.text);
                        } else {
                          updateTask(editingId!, controller.text);
                        }
                      },
                      child: Text(editingId == null ? "Add" : "Update"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    child: ListTile(
                      title: Text(task["title"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => startEditing(task),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteTask(task["id"]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}