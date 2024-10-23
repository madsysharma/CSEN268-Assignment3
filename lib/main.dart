import 'package:assignment3/pages/bloc/book_app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/start_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return BlocProvider(
      create: (context) => BookAppBloc(),
      child: MaterialApp(
          title: 'Assignment 3',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StartPage()),
    );
  }
}
