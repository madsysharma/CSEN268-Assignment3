import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget{
  //A card for displaying a book cover
  final Book book;
  const BookCard({super.key, required this.book}); 

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage("assets/"+book.imageUrl), width:100, height:166.67);
  }
}