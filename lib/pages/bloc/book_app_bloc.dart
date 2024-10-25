import 'package:bloc/bloc.dart';
import '../../models/book.dart';
import '../../services/mock.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'book_app_event.dart';
import 'book_app_state.dart';

class BookAppBloc extends Bloc<BookAppEvent, BookAppState> {
  List<String> authorList=Mock.fetchAuthors();
  List<String> titleList=Mock.fetchTitles();
  List<String> photoList=Mock.fetchUrls();
  
  BookAppBloc() : super(BookAppWaiting(books: [], pickedFilter: Filter.author)) {

    on<SortAuthorEvent>((event, emit) async{
      emit(BookAppWaiting(books: state.books, pickedFilter: Filter.author));
      await _loading();
      final sortedBooksByAuthor=List<Book>.from(state.books)..sort((a,b)=>a.bookAuthor.compareTo(b.bookAuthor));
      emit(BookAppAuthor(books: sortedBooksByAuthor, pickedFilter: Filter.author));
    });

    on<SortTitleEvent>((event,emit) async{
      emit(BookAppWaiting(books: state.books, pickedFilter: Filter.title));
      await _loading();
      final sortedBooksByTitle=List<Book>.from(state.books)..sort((a,b)=>a.bookTitle.compareTo(b.bookTitle));
      emit(BookAppTitle(books: sortedBooksByTitle, pickedFilter: Filter.title));
    });

    on<SelectBookEvent>((event, emit) {
      emit(BookAppDetails(books: state.books, selected: event.selected, pickedFilter: state.pickedFilter));
    });
  }

  List<Book> _initial(){
      //Initializing the list of books present
      List<Book> bookList=[];
      for (int i=0;i<titleList.length;i++){
        bookList.add(Book(bookTitle: titleList[i], bookAuthor: authorList[i], description: lorem(paragraphs: 1, words: 150), imageUrl: photoList[i]));
      }
      return bookList;
  }

  Future<void> _loading() async{
    return Future.delayed(Duration(seconds: 5));
  }

  void init() async{
    //Called when the app is initialized
    await _loading();
    emit(BookAppAuthor(books: _initial()..sort((a,b)=>a.bookAuthor.compareTo(b.bookAuthor)), pickedFilter: Filter.author));
  }

  void reset(){
    emit(BookAppAuthor(books: _initial()..sort((a,b)=>a.bookAuthor.compareTo(b.bookAuthor)), pickedFilter: Filter.author));
  }
}