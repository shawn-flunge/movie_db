


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/const.dart';
import 'package:movie_db/pages/detail_page.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';



class CustomCardHorizontal extends StatelessWidget{

  final MovieModel model;
  CustomCardHorizontal(this.model);

  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);

    Image image = Image.network('https://image.tmdb.org/t/p/w185${model.posterPath}',fit: BoxFit.fill,height: 300,);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            child: Container(
              height: image.height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag:'${model.posterPath}',
                  child: Image.network('https://image.tmdb.org/t/p/w185${model.posterPath}',fit: BoxFit.fill,height: 300,),
                ),
              ),
            ),
            onTap: (){
              movieProvider.movieSelect(model);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
            },
          ),
          Expanded(
            child: Container(         
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child:Column(
                children: [
                  Text(model.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Builder(
                    builder: (context){         
                      return convertAverageToStar(model.voteAverage);
                    },
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
    
  }

}

class CustomCardVertical extends StatelessWidget{

  final MovieModel model;
  CustomCardVertical(this.model);

  @override
  Widget build(BuildContext context) {
    Image image = Image.network('https://image.tmdb.org/t/p/w185${model.posterPath}',fit: BoxFit.fill,height: 150,);
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: image,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
            Expanded(
              child: Column(   
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(model.title,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    // height: 40,
                    child:convertAverageToStar(model.voteAverage)
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          // margin: EdgeInsets.symmetric(vertical: 30),
                          child:Align(
                            alignment: FractionalOffset(0.0, 1.0),
                            child: Builder(
                              builder: (context){
                                var str ='';
                                for(int i=0;i<model.genress.length;i++){
                                  str += model.genress[i] +' ';
                                }
                                return Text(str);
                              },
                            ),
                          )          
                        ),
                        Expanded(
                          flex: 1,
                          child:Align(
                            alignment: FractionalOffset(1.0, 1.0),
                            child: Text(model.releaseDate),
                          ) 
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: (){
          movieProvider.movieSelect(model);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
        },
      ),
      
    );
    
  }
}







