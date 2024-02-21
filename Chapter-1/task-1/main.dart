class Book {
  String title;
  String author;
  int pages;

  Book(this.title, this.author, this.pages);

  void displayBookInfo() {
    print("Title: $title");
    print("Author: $author");
    print("Pages: $pages");
    print("------------------------");
  }

  String isThickBook() {
    return pages > 300 ? "This is a thick book." : "This is not a thick book.";
  }


  double calculateReadingTime(double readingSpeed) {
    return pages / readingSpeed;
  }
}

class Library {

  String name;
  List<Book> books = [];

  Library(this.name);

  void addBook(Book book) {
    books.add(book);
    print("${book.title} has been added to $name.");
  }

  void displayLibraryBooks() {
    print("Books in $name:");
    for (var book in books) {
      book.displayBookInfo();
    }
  }

  Book? findBookByTitle(String title) {
    for (var book in books) {
      if (book.title == title) {
        return book;
      }
    }
    return null;
  }
}

class ExtendedLibrary {

  String name;
  String location;
  int totalBook;

  ExtendedLibrary(this.name, this.location, this.totalBook);

  void showLibrary() {
    print('Library name: $name');
    print('Location: $location');
    print('Total Book: $totalBook');
  }

  void addBook(int book) {
    totalBook += book;
    print('Total Book: $totalBook');
  }

  void borrowBook(int book) {
    if (totalBook >= book) {
      totalBook -= book;
      print('Successfully borrowed $book books.');
      print('Total Book: $totalBook');
    } else {
      print('Not enough books available for borrowing.');
    }
  }
}

void main() {

  var book1 = Book("The Hobbit", "J.R.R. Tolkien", 310);
  var book2 = Book("To Kill a Mockingbird", "Harper Lee", 281);
  var book3 = Book("1984", "George Orwell", 328);

  var library = Library("City Library");

  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  library.displayLibraryBooks();

  var searchedBook = library.findBookByTitle("To Kill a Mockingbird");
  if (searchedBook != null) {
    print("Book found:");
    searchedBook.displayBookInfo();
  } else {
    print("Book not found.");
  }

  print("${book1.title} is thick: ${book1.isThickBook()}");
  print("${book2.title} reading time at 200 words per minute: ${book2.calculateReadingTime(200)} hours");

  var extendedLibrary = ExtendedLibrary("Central Library", "Downtown", 1000);

  extendedLibrary.showLibrary();

  extendedLibrary.addBook(200);

  extendedLibrary.borrowBook(150);
}
