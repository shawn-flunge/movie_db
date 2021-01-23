


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/models/MovieModel.dart';



class CustomCardHorizontal extends StatelessWidget{

  final MovieModel model;
  CustomCardHorizontal(this.model);

  @override
  Widget build(BuildContext context) {
    Image image = Image.network('https://image.tmdb.org/t/p/w185${model.posterPath}',fit: BoxFit.fill,height: 300,);
    print(model.voteAverage);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            child: Container(
              height: image.height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: image,
              ),
            ),
            onTap: (){print('gg');},
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
                      return transferAverageToStar(model.voteAverage);
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
    
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(

        child: Row(
          children: [Text(model.title)],
        ),

      ),
    );
    
  }
}



Widget transferAverageToStar(var score){
     if(score>9.5){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
        ],
      );
    }
    else if(score>8){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
    else if(score>6){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
    else if(score>4){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
    else if(score >2){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
    else{
      return Row(
        children: [
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
  }



