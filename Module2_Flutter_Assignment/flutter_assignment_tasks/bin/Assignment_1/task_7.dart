import 'dart:io';

void main() {
  print("Enter a number to check if it's prime or not:");
  int num = int.parse(stdin.readLineSync().toString());

  if (num < 2) {
    print("$num is not a prime number.");
  } else {
    bool isPrime = true;
    for (int i = 2; i < num; i++) {
      if (num % i == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      print("$num is a prime number.");
    } else {
      print("$num is not a prime number.");
    }
  }
}