import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  final targetNumber = random.nextInt(100) + 1; // Generates 1-100
  int numberOfGuesses = 0;

  // Lambda function for hints
  final giveHint = (int guess, int target) {
    if (guess > target) return 'Too high!';
    if (guess < target) return 'Too low!';
    return 'Correct!';
  };

  print('Guess the number (1-100):');

  while (true) {
    final input = stdin.readLineSync();
    final guess = int.tryParse(input ?? '');

    if (guess == null) {
      print('Please enter a valid number');
      continue;
    }

    numberOfGuesses++;
    final hint = giveHint(guess, targetNumber);
    print(hint);

    if (hint == 'Correct!') {
      print('You won in $numberOfGuesses guesses!');
      break;
    }
  }
}