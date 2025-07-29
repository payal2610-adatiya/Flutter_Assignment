
import 'dart:io';

void main() {
  while (true) {
    print("Enter a list of integers separated by spaces:");
    String? input = stdin.readLineSync();
    if (input != null) {
      try {
        List<int> integerList = input.split(' ').map(int.parse).toList();
        print("You entered: $integerList");
        break;
      } on FormatException {
        print("Invalid input. Please enter integers only.");
      }
    }
  }
}

