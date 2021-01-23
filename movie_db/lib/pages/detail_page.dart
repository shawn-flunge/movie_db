


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/const.dart';
import 'package:movie_db/models/actor.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/providers/movie_provider.dart';
import 'package:movie_db/widgets/custom_card.dart';
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
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag:'${movieProvider.selectedMovie.posterPath}',
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${movieProvider.selectedMovie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
            stretchModes: [
              StretchMode.zoomBackground
            ],
          ),
        ),
        // SliverList(
        //   delegate: SliverChildListDelegate([
        //     movieInfo(movieProvider.selectedMovie),
        //   ]),
        // ),
        SliverToBoxAdapter(
          child: Container(
            height: 1500,
            color:Colors.teal,
            child: Column(
              children: [
                movieInfo(movieProvider.selectedMovie),
                movieOverview(movieProvider.selectedMovie),
                movieCasting(movieProvider.selectedMovie)
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
      color: Colors.red,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network('https://image.tmdb.org/t/p/w185${model.posterPath}',fit: BoxFit.fill,height: 250,),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
          Expanded(
            child: Column(   
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(model.title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
                // Container(

                //   child: Builder(
                //     builder: (context){
                //       print(model.adult);
                //       if(model.adult)
                //         return Image.asset('assets/Adult.png',height: 15,);
                //       else
                //         return Text('bb');

                //     },
                //   ),
                // ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
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
                          color: Colors.teal,
                          decoration: TextDecoration.none
                        ),
                      );
                    },
                  )
                ),
                Container(

                  child: Text(
                    model.releaseDate,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
                Container(
                  // height: 40,
                  child:Row(
                    children: [
                      transferAverageToStar(model.voteAverage),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5),),
                      Text(
                        model.voteAverage.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.teal,
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
      // height: 250,
      color: Colors.red,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '개요',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              decoration: TextDecoration.none
            ),
          ),
          Text(
            model.overview,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
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
    // print(await tmdb.v3.movies.getPouplar(language:'ko',page: 3,region: 'KR'));
    // print(await tmdb.v3.movies.getPouplar());
    
    // var jsonData = await tmdb.v3.movies.getNowPlaying(language: 'ko',region: 'KR');
    var jsonData = await tmdb.v3.movies.getCredits(model.id);
    var dynamicList = jsonData['cast'];
    // print(dynamicList.runtimeType);

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
      color: Colors.red,
      margin: EdgeInsets.all(20),
      child: Column(  
        
        children: [
          Text(
            '주요 출연진',
            style: TextStyle(
              fontSize: 18,
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

  Widget movieReview(MovieModel model){

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
      color: Colors.blue,
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
              color: Colors.black,
              decoration: TextDecoration.none
            )
          )
        ],
      ),
    );
  }

  
  



}