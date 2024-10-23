import 'package:assignment3/pages/bloc/book_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/book_app_bloc.dart';
import 'views/book_list_page.dart';
import 'views/details_page.dart';

//When the app starts, this is where it redirects to.
class StartPage extends StatelessWidget{

  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc=context.read<BookAppBloc>();
    WidgetsBinding.instance.addPostFrameCallback((context){
      bloc.init();
    });
    return Scaffold(
      body: BlocListener<BookAppBloc, BookAppState>(
        listener: (context, state){
          if (state is BookAppAuthor || state is BookAppTitle){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => BookListPage() //redirect to the page for the Book List, sorted by author by default
              )
            );
          } else if (state is BookAppDetails){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => DetailsPage(displayedBook: state.selected) //display the Book Details page for any book selected
              )
            );
          }
        },
        child: Center(
          child: SizedBox(
            height:40,
            width:40,
            child: CircularProgressIndicator(), //while pages or lists are loading
          ),
        ),
      )
    );
  }
}