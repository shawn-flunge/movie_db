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


  fetchNowPlayingMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showAll()
    );
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getPouplar(language: 'ko',region: 'KR');
    var dynamicList = jsonData['results'];

    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      lists.add(
        MovieModel(
          adult: dynamicList[i]['adult'],
          backdropPath: dynamicList[i]['backdrop_path'],
          id: dynamicList[i]['id'],
          originalLanguage: dynamicList[i]['original_language'],
          originalTitle: dynamicList[i]['original_title'],
          overview: dynamicList[i]['overview'],
          popularity: dynamicList[i]['popularity'],
          posterPath: dynamicList[i]['poster_path'],
          releaseDate: dynamicList[i]['release_date'],
          title: dynamicList[i]['title'],
          video: dynamicList[i]['video'],
          voteAverage: dynamicList[i]['vote_average'],
          voteCount: dynamicList[i]['vote_count']
        )
      );
    }
    
  }

  fetchUpComingMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showAll()
    );
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getPouplar(language: 'ko',region: 'KR');
    var dynamicList = jsonData['results'];

    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      lists.add(
        MovieModel(
          adult: dynamicList[i]['adult'],
          backdropPath: dynamicList[i]['backdrop_path'],
          id: dynamicList[i]['id'],
          originalLanguage: dynamicList[i]['original_language'],
          originalTitle: dynamicList[i]['original_title'],
          overview: dynamicList[i]['overview'],
          popularity: dynamicList[i]['popularity'],
          posterPath: dynamicList[i]['poster_path'],
          releaseDate: dynamicList[i]['release_date'],
          title: dynamicList[i]['title'],
          video: dynamicList[i]['video'],
          voteAverage: dynamicList[i]['vote_average'],
          voteCount: dynamicList[i]['vote_count']
        )
      );
    }
    
  }

  fetchPopularMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showAll()
    );
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getPouplar(language: 'ko',region: 'KR');
    var dynamicList = jsonData['results'];

    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      List<int> genreIds=List<int>.from(dynamicList[i]['genre_ids']);

      lists.add(
        MovieModel(
          adult: dynamicList[i]['adult'],
          backdropPath: dynamicList[i]['backdrop_path'],
          id: dynamicList[i]['id'],
          originalLanguage: dynamicList[i]['original_language'],
          originalTitle: dynamicList[i]['original_title'],
          overview: dynamicList[i]['overview'],
          popularity: dynamicList[i]['popularity'],
          posterPath: dynamicList[i]['poster_path'],
          releaseDate: dynamicList[i]['release_date'],
          title: dynamicList[i]['title'],
          video: dynamicList[i]['video'],
          voteAverage: dynamicList[i]['vote_average'],
          voteCount: dynamicList[i]['vote_count'],
          genreIds: genreIds
        )
      );
      print(lists[i].genreIds);
      
    }


    
  }

  fetchTopRatedMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showAll()
    );
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getPouplar(language: 'ko',region: 'KR');
    var dynamicList = jsonData['results'];

    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      lists.add(
        MovieModel(
          adult: dynamicList[i]['adult'],
          backdropPath: dynamicList[i]['backdrop_path'],
          id: dynamicList[i]['id'],
          originalLanguage: dynamicList[i]['original_language'],
          originalTitle: dynamicList[i]['original_title'],
          overview: dynamicList[i]['overview'],
          popularity: dynamicList[i]['popularity'],
          posterPath: dynamicList[i]['poster_path'],
          releaseDate: dynamicList[i]['release_date'],
          title: dynamicList[i]['title'],
          video: dynamicList[i]['video'],
          voteAverage: dynamicList[i]['vote_average'],
          voteCount: dynamicList[i]['vote_count']
        )
      );
    }
    
  }



  @override
  void initState() {
    fetchPopularMovie();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    fetchPopularMovie();
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
