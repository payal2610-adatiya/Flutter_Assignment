import 'dart:io';

void main()
{
  print("ENTER THE LENGTH OF THE FIBONACCI SERIES");
  int n=int.parse(stdin.readLineSync().toString());
  Fibo(n);
}
Fibo(int n)
{
  int a=0;
  int b=1;
  print(a);
  for(int i=1;i<n;i++)
    {
      print(b);
      int c=a+b;
      a=b;
      b=c;
    }
}