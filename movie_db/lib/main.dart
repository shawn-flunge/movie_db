import 'package:flutter/material.dart';
import 'package:movie_db/const.dart';
import 'package:movie_db/pages/main_page.dart';
import 'package:movie_db/providers/movie_provider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieProvider>(create: (context)=> MovieProvider())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie DataBase',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF000000,customColor),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page')
      home: MainPage(),
    );
  }
}
