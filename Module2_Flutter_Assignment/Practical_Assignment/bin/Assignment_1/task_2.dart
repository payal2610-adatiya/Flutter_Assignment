import 'dart:io';

void main() {
  print("TEMPERATURE CONVERTER");
  print("1. Celsius to Fahrenheit");
  print("2. Fahrenheit to Celsius");

  print("ENTER YOUR CHOICE (1 OR 2)");
  int choice = int.parse(stdin.readLineSync().toString());

  if(choice == 1) {
    print("ENTER TEMPERATURE IN CELSIUS:");
    double celsius = double.parse(stdin.readLineSync().toString());
    double fahrenheit = (celsius * 9/5) + 32;
    print("$celsius°C IS EQUAL TO $fahrenheit°F");
  }
  else if(choice == 2) {
    print("ENTER TEMPERATURE IN FAHRENHEIT:");
    double fahrenheit = double.parse(stdin.readLineSync().toString());
    double celsius = (fahrenheit - 32) * 5/9;
    print("$fahrenheit°F IS EQUAL TO $celsius°C");
  }
  else {
    print("INVALID CHOICE! PLEASE ENTER 1 OR 2");
  }
}