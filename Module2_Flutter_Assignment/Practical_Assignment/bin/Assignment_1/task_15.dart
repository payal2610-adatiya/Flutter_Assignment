void main() {
  String input = "hello world";
  Map<String, int> charFrequency = countCharacterFrequency(input);
  charFrequency.forEach((char, frequency) {
    print('$char: $frequency');
  });
}
Map<String, int> countCharacterFrequency(String str) {
  Map<String, int> frequencyMap = {};

  for (int i = 0; i < str.length; i++) {
    String char = str[i];
    if (frequencyMap.containsKey(char)) {
      frequencyMap[char] = frequencyMap[char]! + 1;
    } else {
      frequencyMap[char] = 1;
    }
  }

  return frequencyMap;
}