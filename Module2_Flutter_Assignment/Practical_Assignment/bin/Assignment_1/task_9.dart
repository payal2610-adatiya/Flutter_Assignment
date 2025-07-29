import 'dart:io';

void main()
{
  print("ENTER NUMBER FOR FACTORIAL");
  int n=int.parse(stdin.readLineSync().toString());
  int f=1;
  for(int i=1;i<=n;i++)
  {
    f*=i;
  }
  print(f);
}