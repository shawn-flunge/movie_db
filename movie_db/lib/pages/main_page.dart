


import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_db/const.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/providers/movie_provider.dart';
import 'package:movie_db/widgets/custom_card.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MainPage extends StatefulWidget{
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>{

  
  Future<List<MovieModel>> fetchNowPlayingMovie() async{

    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showNone()
    );

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

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  checkInternetConnected() async{
    if(!await check())
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('인터넷 연결'),
            content: Text('인터넷이 연결되어 있지 않습니다.'),
            actions: [
              FlatButton(
                child:Text('종료'),
                onPressed: ()=> SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              )
            ],
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider= Provider.of<MovieProvider>(context);
    checkInternetConnected();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 100, 15, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: <Widget>[          
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget('현재 상영중',35),
                  Container(
                    alignment: Alignment.center,
                    height: 400,
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
                padding: EdgeInsets.symmetric(vertical: 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget('개봉 예정',35),
                  Container(
                    alignment: Alignment.center,
                    height: 400,
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
                padding: EdgeInsets.symmetric(vertical: 30),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget('인기',35),
                  Container(
                    alignment: Alignment.center,
                    height: 400,
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
                padding: EdgeInsets.symmetric(vertical: 30),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget('높은 평점',35),
                  Container(
                    height: 400,
                    alignment: Alignment.center,
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
          margin: EdgeInsets.all(10),
          child: CustomCardVertical(lists[index]),
        );
      },
    );
  }




}