import 'dart:io';

void main() async {
  final file = File('D:/data.txt');
  try {
    await file.writeAsString('Hello from Dart! This is file I/O demo.\nCurrent time: ${DateTime.now()}');
    print('Data written successfully to ${file.path}');
    final content = await file.readAsString();
    print('\nFile content:\n$content');
  } catch (e) {
    print('An error occurred: $e');
  }
}

