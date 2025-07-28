import 'dart:io';

void main() {
  String? input1 = stdin.readLineSync();
  String? input2 = stdin.readLineSync();

  try {
    double dividend = double.parse(input1!);
    double divisor = double.parse(input2!);

    if (divisor == 0) {
      throw DivisionByZeroException();
    }

    double result = dividend / divisor;
    print(result);
  } on FormatException {
    print("Error: Please enter valid numbers");
  } on DivisionByZeroException {
    print("Error: Cannot divide by zero");
  } catch (e) {
    print("An error occurred: $e");
  }
}

class DivisionByZeroException implements Exception {}