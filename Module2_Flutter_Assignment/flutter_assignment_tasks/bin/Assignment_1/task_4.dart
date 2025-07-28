import 'dart:io';

void main()
{
  const PI=3.14;
  print("ENTER THE RADIUS OF CIRCLE");
  var r=int.parse(stdin.readLineSync().toString());
  var area=PI*r*r;
  var circumstance=2*PI*r;
  print("AREA OF CIRCLE IS $area");
  print("CIRCUMSTANCE OF CIRCLE $circumstance ");
}