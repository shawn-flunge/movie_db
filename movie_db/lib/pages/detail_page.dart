


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/const.dart';
import 'package:movie_db/models/actor.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/models/review.dart';
import 'package:movie_db/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

class DetailPage extends StatefulWidget{

  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage>{

  @override
  Widget build(BuildContext context) {

    MovieProvider movieProvider = Provider.of<MovieProvider>(context);
    
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag:'${movieProvider.selectedMovie.posterPath}',
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${movieProvider.selectedMovie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
            stretchModes: [
              StretchMode.zoomBackground,
              StretchMode.blurBackground
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Colors.white,
            ),
            height: 1500,
            
            child: Column(
              children: [
                movieInfo(movieProvider.selectedMovie),
                movieOverview(movieProvider.selectedMovie),
                movieCasting(movieProvider.selectedMovie),
                movieReview(movieProvider.selectedMovie),
              ],
            )//ff(),
          ),
        )
        
      ],
    ); 
  }

  Widget movieInfo(MovieModel model){

    return Container(
      height: 250,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network('https://image.tmdb.org/t/p/w185${model.posterPath}',fit: BoxFit.fill,height: 250,),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Expanded(
            child: Column(   
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    model.title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child:Builder(
                    builder: (context){
                      var str ='';
                      for(int i=0;i<model.genress.length;i++){
                        str += model.genress[i] +' ';
                      }
                      return Text(
                        str,
                        style: TextStyle(
                          fontSize:18,
                          color: Colors.black45,
                          decoration: TextDecoration.none
                        ),
                      );
                    },
                  )
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    model.releaseDate,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child:Row(
                    children: [
                      convertAverageToStar(model.voteAverage),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5),),
                      Text(
                        model.voteAverage.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(255, 199, 0, 1),
                          decoration: TextDecoration.none
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget movieOverview(MovieModel model){
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '개요',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              decoration: TextDecoration.none
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10),),
          Text(
            model.overview,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black45,
              decoration: TextDecoration.none
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ActorModel>> fetchActor(MovieModel model) async{
    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showNone()
    );

    var jsonData = await tmdb.v3.movies.getCredits(model.id);
    var dynamicList = jsonData['cast'];

    List<ActorModel> lists = List<ActorModel>();

    for(int i=0; i<10;i++){
      lists.add(
        ActorModel(
          name: dynamicList[i]['name'],
          character: dynamicList[i]['character'],
          profilePath: dynamicList[i]['profile_path']
        )
      );
    }
    return lists;
  }

  

  Widget movieCasting(MovieModel model){
    
    return Container(
      height: 250,
      margin: EdgeInsets.all(20),
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '주요 출연진',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              decoration: TextDecoration.none
            ),
          ),
          Container(
            height: 200,
            child: FutureBuilder<List<ActorModel>>(
              future: fetchActor(model),
              builder: (context,snapshot){
                return snapshot.hasData ? actorListView(snapshot.data) : SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),);
              },
            ),
          )
        ],
      ),
    );
  }

  

  Widget actorListView(List<ActorModel> lists){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: lists.length,
      itemBuilder: (context, index){
        return Container(
          width: 120,
          height: 150,
          margin: EdgeInsets.all(10),
          child:actorInfo(lists[index])
        );
      },
    );
  }

  Widget actorInfo(ActorModel model){
    
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network('https://image.tmdb.org/t/p/w185${model.profilePath}',fit: BoxFit.fill,height: 70,),
          ),
          Text(
            model.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.none
            )
          ),
          Text(
            model.character,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black45,
              decoration: TextDecoration.none
            )
          )
        ],
      ),
    );
  }

  Future<List<ReviewModel>> fetchReview(MovieModel model) async{
    TMDB tmdb = TMDB(
      ApiKeys(API_KEY,AUTH_TOKEN),
      logConfig: ConfigLogger.showNone()
    );
    var jsonData = await tmdb.v3.movies.getReviews(model.id);
    var dynamicList = jsonData['results'];
    List<ReviewModel> lists = List<ReviewModel>();

    for(int i=0; i<dynamicList.length;i++){
      var str ='';
      if(dynamicList[i]['content'].length>70){
        str = dynamicList[i]['content'].toString().substring(0,69)+'....';
      }
      lists.add(
        ReviewModel(
          author: dynamicList[i]['author'],
          content: str
        )
      );
    }
    return lists;
  }

  Widget movieReview(MovieModel model){
    return Container(
      height: 400,
      
      margin: EdgeInsets.all(20),
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '리뷰',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              decoration: TextDecoration.none
            ),
          ),
          Container(
            height: 350,
            child: FutureBuilder<List<ReviewModel>>(
              future: fetchReview(model),
              builder: (context,snapshot){
                if(snapshot.hasError)
                  return Text(
                    '리뷰가 없습니다.',
                     style: TextStyle(
                      fontSize: 250,
                      color: Colors.black,
                      decoration: TextDecoration.none
                    ),
                  );
                else
                  return snapshot.hasData ? reviewListView(snapshot.data) : SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),);
              },
            ),
          )
        ],
      ),
    );
  }
  

  Widget reviewListView(List<ReviewModel> lists){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: lists.length,
      itemBuilder: (context, index){
        return Container(
          height: 120,
          margin: EdgeInsets.all(10),
          child:reviewInfo(lists[index])
        );
      },
    );
  }

  Widget reviewInfo(ReviewModel model){
    print(model.author);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey
        ),
        borderRadius: BorderRadius.all( Radius.circular(10), )
      ),
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              model.content,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                decoration: TextDecoration.none
              )
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset(1.0, 1.0),
              child:Text(
                model.author,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  decoration: TextDecoration.none
                )
              )
            ),
          ),
        ],
      ),
    );
  }
  



}