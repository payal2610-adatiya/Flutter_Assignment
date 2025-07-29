
void main() {
  List<double> numbers = [1, 2, 3, 4, 5];

  print("Squares: ${applyOperation(numbers, (x) => x * x)}");
  print("Cubes: ${applyOperation(numbers, (x) => x * x * x)}");
  print("Halves: ${applyOperation(numbers, (x) => x / 2)}");
}

List<double> applyOperation(List<double> numbers, double Function(double) operation) {
  return numbers.map(operation).toList();
}
