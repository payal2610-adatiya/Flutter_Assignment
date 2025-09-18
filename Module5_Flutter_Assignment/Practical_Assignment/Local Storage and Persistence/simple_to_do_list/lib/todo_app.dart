import 'package:flutter/material.dart';
import 'dp_helper.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<Map<String, dynamic>> tasks = [];
  final TextEditingController controller = TextEditingController();
  int? editingId;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final data = await DBHelper.getTasks();
    setState(() {
      tasks = data;
    });
  }

  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) return;
    await DBHelper.insertTask(title);
    controller.clear();
    loadTasks();
  }

  Future<void> updateTask(int id, String newTitle) async {
    if (newTitle.trim().isEmpty) return;
    await DBHelper.updateTask(id, newTitle);
    controller.clear();
    editingId = null;
    loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await DBHelper.deleteTask(id);
    loadTasks();
  }

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
