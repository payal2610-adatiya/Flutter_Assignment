void main() {
  List<String> words = [
    "apple",
    "banana",
    "apple",
    "orange",
    "banana",
    "grape"
  ];

  var uniqueWords = words.toSet();
  print(uniqueWords);
  print(uniqueWords.toList()..sort());
}

