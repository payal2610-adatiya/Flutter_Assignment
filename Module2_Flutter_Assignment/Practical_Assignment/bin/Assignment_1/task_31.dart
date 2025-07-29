import 'dart:async';

Stream<int> generateNumbers(int count) async* {
  for (int i = 1; i <= count; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  print('Starting to generate numbers...');

  Stream<int> numberStream = generateNumbers(5);

  await for (int number in numberStream) {
    print('Emitted: $number');
  }

  print('Stream completed.');
}
