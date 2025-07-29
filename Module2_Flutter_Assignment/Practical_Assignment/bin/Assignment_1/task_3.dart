import 'dart:io';

void main()
{
  var num;
  print("enter any number ");
  num=int.parse(stdin.readLineSync().toString());
  if(num%2==0)
    {
      print("$num is even ");
    }
  else
    {
      print("$num is odd");
    }
}