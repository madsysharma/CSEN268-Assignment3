import 'package:equatable/equatable.dart';
import '../../models/book.dart';
abstract class BookAppEvent extends Equatable{
  const BookAppEvent();

  @override
  List<Object> get props => [];
}

class LoadBooksEvent extends BookAppEvent{

}

class SortAuthorEvent extends BookAppEvent{

}

class SortTitleEvent extends BookAppEvent{

}

class SelectBookEvent extends BookAppEvent{
  final Book selected;

  const SelectBookEvent({required this.selected});

  @override
  List<Object> get props => [selected];
}