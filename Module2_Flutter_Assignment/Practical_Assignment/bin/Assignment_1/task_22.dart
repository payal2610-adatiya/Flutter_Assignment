import 'dart:io';

void readFile(String filePath) {
  try {
    File file = File(filePath);
    String contents = file.readAsStringSync();
    print(contents);
  } catch (e) {
    if (e is FileSystemException) {
      print('Error: The file "$filePath" was not found.');
    } else {
      print('An error occurred: $e');
    }
  }
}

void main() {
  String filePath = 'D:/example.txt';
  readFile(filePath);
}