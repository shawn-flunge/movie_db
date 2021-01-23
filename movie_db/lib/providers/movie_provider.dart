

import 'package:flutter/cupertino.dart';
import 'package:movie_db/models/movie.dart';

class MovieProvider with ChangeNotifier{

  MovieModel selectedMovie;

  movieSelect(MovieModel movie){
    this.selectedMovie=movie;
    notifyListeners();
  }

}