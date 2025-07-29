import 'dart:io';

void main() {
  print("Enter text to check if it's a palindrome:");
  String input = stdin.readLineSync() ?? '';

  bool isPalindrome = true;
  int i = 0;
  int j = input.length - 1;

  while (i < j) {
    if (input[i] != input[j]) {
      isPalindrome = false;
      break;
    }
    i++;
    j--;
  }

  if (isPalindrome) {
    print("'$input' is a palindrome!");
  } else {
    print("'$input' is not a palindrome.");
  }
}