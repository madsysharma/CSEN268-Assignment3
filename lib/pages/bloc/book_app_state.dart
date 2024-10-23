import '../../models/book.dart';
import 'package:equatable/equatable.dart';

enum Filter{title,author} //used for setting the selected state of the filter chips

abstract class BookAppState extends Equatable{
  final List<Book> books;
  final Filter pickedFilter;
  const BookAppState({required this.books, required this.pickedFilter});

  @override
  List<Object> get props=>[books];
}

//Displaying the book list sorted by author
final class BookAppAuthor extends BookAppState {
  const BookAppAuthor({required List<Book> books, required Filter pickedFilter}) : super(books: books, pickedFilter: pickedFilter);
}

//Displaying the book list sorted by title
final class BookAppTitle extends BookAppState {
  const BookAppTitle({required List<Book> books, required Filter pickedFilter}) : super(books:books, pickedFilter: pickedFilter);
}

//Showing circular progress indicator while lists are loading after clicking on filter
final class BookAppWaiting extends BookAppState {
  const BookAppWaiting({required List<Book> books, required Filter pickedFilter}) : super(books: books, pickedFilter: pickedFilter);
}

final class BookAppDetails extends BookAppState {
  final Book selected;
  const BookAppDetails({required List<Book> books, required this.selected, required Filter pickedFilter}): super(books:books, pickedFilter: pickedFilter);
}