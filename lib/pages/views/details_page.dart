import 'package:assignment3/pages/bloc/book_app_bloc.dart';
import 'package:assignment3/widgets/book_card.dart';
import 'package:assignment3/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/book.dart';
import 'package:assignment3/pages/bloc/book_app_state.dart';

//Page for displaying details of a book selected from the list
class DetailsPage extends StatelessWidget{
  final Book displayedBook;
  
  const DetailsPage({super.key, required this.displayedBook});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text: "Book Detail", screen: "Details Page"),
        body: BlocBuilder<BookAppBloc,BookAppState>(
          builder: (context,state){
            return SizedBox(
              height: 852,
              width: 393,
              child: Container(
                constraints: BoxConstraints(maxHeight: double.infinity),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      BookCard(book: this.displayedBook),
                      SizedBox(height: 15),
                      Text(this.displayedBook.bookTitle,style:Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.left,),
                      SizedBox(height: 15),
                      Text(this.displayedBook.bookAuthor,style:Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.left,),
                      SizedBox(height:15),
                      Text(this.displayedBook.description,style:Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.left,)
                    ],
                  )
                ),
              ),
            );
        })
      ),
    );
  }
}