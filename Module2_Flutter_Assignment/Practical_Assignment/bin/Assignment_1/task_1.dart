/*Write a program that takes a user's name and age as input and prints a welcome messagethat
includes their name and how many years they have left until they turn 100*/
import 'dart:io';

void main()
{
  var name,age;
  print("enter your name");
  name=stdin.readLineSync().toString();
  print("enter your age");
  age=int.parse(stdin.readLineSync().toString());
var left_year=100-age;
print("WELCOME ! $name YOU HAVE $left_year LEFT UNTIL YOU TURN 100");
}