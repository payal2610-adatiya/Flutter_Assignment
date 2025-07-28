void main()
{
  print("wait for 3 seconds");
  Future.delayed(Duration(seconds: 3),()=>print("operation complete"));
}