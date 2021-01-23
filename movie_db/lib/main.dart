import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/const.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/pages/detail_page.dart';
import 'package:movie_db/providers/movie_provider.dart';
import 'package:movie_db/widgets/custom_card.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

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


  Future<List<MovieModel>> fetchNowPlayingMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showNone()
    );
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getNowPlaying(language: 'ko',region: 'KR');
    var dynamicList = jsonData['results'];
    
    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      
      var jsonData = await tmdb.v3.movies.getDetails(dynamicList[i]['id'],language: 'ko');
      var genresData = jsonData['genres'];

      List<String> temp = List<String>();
      for(int i=0;i<genresData.length;i++){
        temp.add(genresData[i]['name']);  
      }

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
          genress: temp
        )
      );
    }
    return lists;
  }

  Future<List<MovieModel>> fetchUpComingMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showNone()
    );
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getUpcoming(language: 'ko',region: 'KR');
    var dynamicList = jsonData['results'];

    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      var jsonData = await tmdb.v3.movies.getDetails(dynamicList[i]['id'],language: 'ko');
      var genresData = jsonData['genres'];

      List<String> temp = List<String>();
      for(int i=0;i<genresData.length;i++){
        temp.add(genresData[i]['name']);  
      }

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
          genress: temp
        )
      );
    }
    return lists;
  }

  Future<List<MovieModel>> fetchPopularMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showNone()
    );
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getPouplar(language: 'ko',region: 'KR');
    var dynamicList = jsonData['results'];

    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      var jsonData = await tmdb.v3.movies.getDetails(dynamicList[i]['id'],language: 'ko');
      var genresData = jsonData['genres'];

      List<String> temp = List<String>();
      for(int i=0;i<genresData.length;i++){
        temp.add(genresData[i]['name']);  
      }

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
          genress: temp
        )
      );
    }
    return lists;
  }

  Future<List<MovieModel>> fetchTopRatedMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showNone()
    );
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    var jsonData = await tmdb.v3.movies.getTopRated(language: 'ko',region: 'KR');
    var dynamicList = jsonData['results'];

    List<MovieModel> lists = List<MovieModel>();

    for(int i=0;i<dynamicList.length;i++){
      var jsonData = await tmdb.v3.movies.getDetails(dynamicList[i]['id'],language: 'ko');
      var genresData = jsonData['genres'];

      List<String> temp = List<String>();
      for(int i=0;i<genresData.length;i++){
        temp.add(genresData[i]['name']);  
      }

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
          genress: temp
        )
      );
    }
    return lists;
  }



  // @override
  // void initState() {
  //   fetchPopularMovie();
  //   super.initState();
    
  // }

  

  @override
  Widget build(BuildContext context) {

    // fetchPopularMovie();
    // fetchMovie2();
    MovieProvider movieProvider= Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[          
            Column(
              children: [
                textWidget('현재 상영중',35),
                Container(
                  height: 400,
                  color: Colors.pink,
                  child:FutureBuilder<List<MovieModel>>(
                    future: fetchNowPlayingMovie(),
                    builder: (context, snapshot){
                      return snapshot.hasData ? horizontalListView(snapshot.data,movieProvider) : SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),);
                    },
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(100),
            ),
            Column(
              children: [
                textWidget('개봉 예정',35),
                Container(
                  height: 400,
                  color: Colors.pink,
                  child:FutureBuilder<List<MovieModel>>(
                    future: fetchUpComingMovie(),
                    builder: (context, snapshot){
                      return snapshot.hasData ? verticalListView(snapshot.data) : SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),);
                    },
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(100),
            ),
            Column(
              children: [
                textWidget('인기',35),
                Container(
                  height: 400,
                  color: Colors.pink,
                  child:FutureBuilder<List<MovieModel>>(
                    future: fetchPopularMovie(),
                    builder: (context, snapshot){
                      return snapshot.hasData ? verticalListView(snapshot.data) : SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),);
                    },
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(100),
            ),
            Column(
              children: [
                textWidget('높은 평점',35),
                Container(
                  height: 400,
                  color: Colors.pink,
                  child:FutureBuilder<List<MovieModel>>(
                    future: fetchTopRatedMovie(),
                    builder: (context, snapshot){
                      return snapshot.hasData ? verticalListView(snapshot.data) : SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),);
                    },
                  )
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget textWidget(String text, double size){
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: size
      ),
    );
  }

  Widget horizontalListView(List<MovieModel> lists, MovieProvider movieProvider){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: lists.length,
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.all(10),
          child:CustomCardHorizontal(lists[index],)
          // (){
          //   movieProvider.movieSelect(lists[index]);
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
          // })
        );
      },
    );
  }


  Widget verticalListView(List<MovieModel> lists){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: lists.length,
      itemBuilder: (context, index){
        return Container(
          color: Colors.purple,
          margin: EdgeInsets.all(10),
          //child: Text(lists[index].title),
          child: CustomCardVertical(lists[index]),
        );
      },
    );
  }



}
