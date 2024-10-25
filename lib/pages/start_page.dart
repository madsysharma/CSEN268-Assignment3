import 'package:assignment3/pages/bloc/book_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/book_app_bloc.dart';
import 'views/book_list_page.dart';
import 'views/details_page.dart';

//When the app starts, this is where it redirects to.
class StartPage extends StatelessWidget{

  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    final bloc=context.read<BookAppBloc>();
    WidgetsBinding.instance.addPostFrameCallback((context){
      bloc.init();
    });
    return Scaffold(
      body: BlocListener<BookAppBloc, BookAppState>(
        listener: (context, state){
          if (state is BookAppAuthor || state is BookAppTitle){
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => BookListPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child){
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOut;
                  final tween = Tween(begin:begin, end:end);
                  final curvedAnimation = CurvedAnimation(
                    parent: animation, 
                    curve: curve
                  );
                  return SlideTransition(
                    position: tween.animate(curvedAnimation),
                    child: child,
                  );
                }
              )
            );
          } else if (state is BookAppDetails){
              Navigator.of(context).push( 
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => DetailsPage(displayedBook:state.selected),
                  transitionsBuilder: (context, animation, secondaryAnimation, child){
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeOut;
                    final tween = Tween(begin:begin, end:end);
                    final curvedAnimation = CurvedAnimation(
                      parent: animation, 
                      curve: curve
                    );
                    return SlideTransition(
                      position: tween.animate(curvedAnimation),
                      child: child,
                    );
                  }
                )
              ).then((context){
                bloc.reset();
              });
          }
        },
        child: Center(
          child: SizedBox(
            height:80,
            width:80,
            child: Column(
              children: [
                Text("Loading..."),
                CircularProgressIndicator(),
              ],
            ), //while pages or lists are loading
          ),
        ),
      )
    );
  }
}