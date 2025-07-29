import 'dart:io';

void main() {
  print("BASIC CALCULATOR");
  print("1. ADDITION");
  print("2. SUBSTRACTION");
  print("3. MULTIPLICATION");
  print("4. DIVISION");
  print(" Enter your choice:(1-4)");
  int choice=int.parse(stdin.readLineSync().toString());
  if(choice<1 || choice>4)
    {
      print("INVALID CHOICE");
      return;
    }
  print("Enter first number:");
  double num1=double.parse(stdin.readLineSync().toString());
  print("Enter second number:");
  double num2=double.parse(stdin.readLineSync().toString());
 double ans;
 switch(choice)
     {
   case 1:
     ans=num1+num2;
     print("ADDITION OF $num1 + $num2 is $ans");
     break;
   case 2:
     ans=num1-num2;
     print("SUBSTRACTION OF $num1 + $num2 is $ans");
     break;
   case 3:
     ans=num1*num2;
     print("MULTIPLICATION OF $num1 * $num2 is $ans");
     break;
   case 4:
     ans=num1/num2;
     print("DIVISION OF $num1 / $num2 is $ans");
     break;
 }
}
