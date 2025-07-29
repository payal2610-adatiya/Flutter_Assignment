import 'dart:io';

void main()
{
  print("ENTER YOUR MARKS");
  int marks=int.parse(stdin.readLineSync().toString());
  if(marks>=70)
  {
    print("GRADE:A");
  }
  else if(marks>=60)
  {
    print("GRADE:B");
  }
  else if(marks>=50)
  {
    print("GRADE:C");

  }
  else if(marks>=40)
  {
    print("GRADE:D");

  }
  else
  {
    print("FAIL");
  }
}