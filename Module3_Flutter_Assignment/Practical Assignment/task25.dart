import 'package:flutter/material.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(_taskController.text);
        _taskController.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _taskController,
          decoration: const InputDecoration(labelText: 'Add Task'),
        ),
        ElevatedButton(
          onPressed: _addTask,
          child: const Text('Add'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(_tasks[index]),
                onDismissed: (direction) {
                  _removeTask(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Task removed')),
                  );
                },
                child: ListTile(title: Text(_tasks[index])),
              );
            },
          ),
        ),
      ],
    );
  }
}