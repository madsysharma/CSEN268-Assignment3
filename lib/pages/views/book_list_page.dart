import 'package:assignment3/pages/bloc/book_app_event.dart';
import 'package:assignment3/pages/bloc/book_app_state.dart';
import 'package:flutter/material.dart';
import 'package:assignment3/pages/bloc/book_app_bloc.dart';
import 'package:assignment3/widgets/book_card.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Page for displaying a horizontal, scrollable list of books
class BookListPage extends StatelessWidget{
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text: "Book Club Home", screen: "Book List"),
        body: BlocBuilder<BookAppBloc, BookAppState>(
          builder: (context, state){
            if (state is BookAppWaiting){
              return Center(
                child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
                )
              );
            }
      
            return SizedBox(
              width: 393,
              height: 852,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:10,right:20,left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Sort by", 
                          style:Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10),
                        FilterChip(
                          showCheckmark: false,
                          label: Text("Author"), 
                          selected: state.pickedFilter==Filter.author,
                          onSelected: (selected) {
                            context.read<BookAppBloc>().add(SortAuthorEvent());
                          }
                        ),
                        SizedBox(width: 10),
                        FilterChip(
                          showCheckmark: false,
                          label: Text("Title"), 
                          selected: state.pickedFilter==Filter.title,
                          onSelected: (selected) {
                            context.read<BookAppBloc>().add(SortTitleEvent());
                          }
                        ),
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Books",
                      style:Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: double.infinity),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.books.map((book){
                          return GestureDetector(
                            onTap: (){
                              context.read<BookAppBloc>().add(SelectBookEvent(selected: book));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: BookCard(book: book)
                            )
                          );
                        }).toList(),
                      )
                    ),
                  )
                ]
              ),
            );
          }
        )
      ),
    );
  }
}