
import 'dart:io';

class BookDetails{
String title,author,gener;
BookDetails(this.title,this.author,this.gener);
static BookDetails createBook(String title,author,gener)
{
  return BookDetails(title,author,gener);
}
}
class LibraryManagementSystem{
  
  
 
  //  void Bookdetails()
  //  {

  //  }
  Map<String,List<BookDetails>> bookdetails={};
List<BookDetails> Book=[];
void addABook(String title,String author,String gener)
{
  BookDetails books = BookDetails.createBook(title, author, gener);
Book.add(books);
}
void displayBook()
{
 for(var bookish in Book)
 {
  print("Title: ${bookish.title} Author: ${bookish.author} Gener: ${bookish.gener}");
 }
}

void searchBook(String query)
{
var searchIt = Book.where((book)=> book.title.toLowerCase().contains(query.toLowerCase())).toList();
if(searchIt.isNotEmpty)
{
 for(var bookish in Book)
 {
  print("Title: ${bookish.title} Author: ${bookish.author} Gener: ${bookish.gener}");
 }
}
else{
  print("No Book in the Library!");
}
}


void isBorrowed(String title)
{
if( Book.any((element)=>element.title == title))
{
print("You Borrowed ${title}");
}
else{
  print("no ");
}
}

  
}


void main()
{
LibraryManagementSystem lib = new LibraryManagementSystem();
int userAllowedInaWeek = 7;

while(true){
print("Choose an option:");
print("1.Add A Book_");
print("2.Show All Book_");
print("3.Search Book_");
print("4.Borrow Book_");
print("5.Exit");
stdout.write("Choose option : ");
String ?choice= stdin.readLineSync()?.trim();

switch(choice){
  case '1':
  stdout.write("Enter Book Title:");
  String Title = stdin.readLineSync()!;
  stdout.write("Enter Book Author:");
  String Author = stdin.readLineSync()!;
  stdout.write("Enter Book Gener:");
  String Gener = stdin.readLineSync()!;
  lib.addABook(Title, Author, Gener);
break;
  case '2': 
  lib.displayBook();
  break;
  case '3':
  stdout.write("Enter Author name for search the book:");
  String Author= stdin.readLineSync()!;
  lib.searchBook(Author);
  break;

 case '4':
 print("Have You Borrowed?");
  stdout.write("Enter Title Of The Book: ");
  String title= stdin.readLineSync()!;
  lib.isBorrowed(title);
  break;

  
}}



}