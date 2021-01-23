


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/models/MovieModel.dart';



class CustomCardHorizontal extends StatelessWidget{

  final MovieModel model;
  CustomCardHorizontal(this.model);

  @override
  Widget build(BuildContext context) {
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
                child: image,
              ),
            ),
            onTap: (){print('gg');},
          ),
          Expanded(
            child: Container(         
              child:Column(
                children: [
                  Text('gg'),
                  Text('ggg')
                ],
              )
            ),
          )
        ],
      ),
    );
    
  }


}

// class CustomCardVertical extends StatelessWidget{


// }