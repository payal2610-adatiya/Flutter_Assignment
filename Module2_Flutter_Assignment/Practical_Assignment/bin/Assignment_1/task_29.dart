void main() {
  List<int> list1 = [3, 5, 1, 7];
  List<int> list2 = [2, 5, 8, 1];
  List<int> list3 = [4, 6, 3, 9];


  List<int> combinedList = [...list1, ...list2, ...list3];

  List<int> uniqueList = combinedList.toSet().toList();

  uniqueList.sort();

  print('Combined, unique, and sorted list: $uniqueList');
}