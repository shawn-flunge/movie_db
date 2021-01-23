


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/providers/movie_provider.dart';
import 'package:provider/provider.dart';

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
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag:'${movieProvider.selectedMovie.posterPath}',
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${movieProvider.selectedMovie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
    
    
  }
}