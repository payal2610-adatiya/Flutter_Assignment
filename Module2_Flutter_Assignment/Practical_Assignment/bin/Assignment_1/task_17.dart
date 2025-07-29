/*Task 17:
 Create a class called Book with properties like title, author, and publication year. Add
 methods to display the book’s details and a method to check if it’s over 10 years old*/
class Book
{
 var title,author,publication_year;
 Book(this.title,this.author,this.publication_year);

 detail()
 {
   print("BOOK TITLE IS: $title");
 print("BOOK AUTHOR IS: $title");
 print("BOOK PUBLICATION YEAR IS: $title");
}
check(int current_year)
{
  return (current_year-publication_year)>10;
}
}
void main()
{
Book b=Book("abc", "abc", 2021);
b.detail();
int current_year=2025;
if(b.check(current_year))
  {
    print("THE BOOK IS OVER 10 YEARS OLD");
  }
else
  {
    print("THE BOOK IS NOT OVER 10 YEARS OLD");

  }
}