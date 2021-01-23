import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/const.dart';
import 'package:movie_db/model/MovieModel.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  fetchMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showAll()
    );

    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getPouplar(language: 'ko');
    var dynamicList = jsonData['results'];

    print(dynamicList.length);
    print(dynamicList[4]['title']);

    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      lists.add(
        MovieModel(
          adult: dynamicList[i]['adult'],
          backdrop_path: dynamicList[i]['backdrop_path'],
          id: dynamicList[i]['id'],
          original_language: dynamicList[i]['original_language'],
          original_title: dynamicList[i]['original_title'],
          overview: dynamicList[i]['overview'],
          popularity: dynamicList[i]['popularity'],
          poster_path: dynamicList[i]['poster_path'],
          release_date: dynamicList[i]['release_date'],
          title: dynamicList[i]['title'],
          video: dynamicList[i]['video'],
          vote_average: dynamicList[i]['vote_average'],
          vote_count: dynamicList[i]['vote_count']
        )
      );
      print(lists[i].title);
    }



    // var rr =await tmdb.v3.movies.getLists(560144);
    // print(rr);
    
  }

  fetchMovie2() async{
    Dio dio = Dio();
    var rr = await dio.get('http://api.themoviedb.org/3/movie/popular?api_key=$API_KEY');
    print(rr.runtimeType);


  }



  @override
  void initState() {
    fetchMovie();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    fetchMovie();
    // fetchMovie2();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
