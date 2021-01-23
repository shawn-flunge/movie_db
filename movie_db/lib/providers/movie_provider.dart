

import 'package:flutter/cupertino.dart';
import 'package:movie_db/models/movie.dart';

class MovieProvider with ChangeNotifier{

  MovieModel selectedMovie;

  Future<void> movieSelect(MovieModel movie){
    this.selectedMovie=movie;
    notifyListeners();
  }

}