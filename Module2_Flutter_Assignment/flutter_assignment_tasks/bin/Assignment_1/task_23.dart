import 'dart:io';


void main()
{
  print("SIMPLE CALCULATOR:");
  try{
    print("Enter first number");
    double a=double.parse(stdin.readLineSync().toString());
    print("Enter first number");
    double b=double.parse(stdin.readLineSync().toString());
    print("Enter operation(+,-,*,/):");
    String op=stdin.readLineSync().toString();
    double res;
    switch(op)
        {
      case '+':
        res=a+b;
        print(res);
        break;
      case '-':
        res=a-b;
        print(res);
        break;
      case '*':
        res=a*b;
        print(res);
        break;
      case '/':
        if(b==0) throw Exception("Cannot divide by 0 ");
        res=a/b;
        print(res);
        break;
      default:
        print("Invalid Operation");

        break;
    }

  }catch(e){
    print(e);
    print('Please enter valid numbers and operator.\n');
  }
}