import 'package:flutter/material.dart';
import 'db_helper.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  List<Map<String, dynamic>> notes = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  /// Load Notes from DB
  Future<void> loadNotes() async {
    final data = await DbHelper.instance.getNotes();
    setState(() {
      notes = data;
    });
  }

  /// Add Note
  Future<void> addNote() async {
    if (titleController.text.trim().isEmpty &&
        contentController.text.trim().isEmpty) return;

    await DbHelper.instance.insertNote({
      "title": titleController.text,
      "content": contentController.text,
    });

    titleController.clear();
    contentController.clear();
    loadNotes();
  }

  /// Delete Note
  Future<void> deleteNote(int id) async {
    await DbHelper.instance.deleteNote(id);
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Notes")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Input section
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Note Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                hintText: "Note Content",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: addNote,
              child: const Text("Add Note"),
            ),
            const SizedBox(height: 16),

            /// Notes List
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    title: Text(
                      note["title"] ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      note["content"] ?? "",
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteNote(note["id"]),
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
