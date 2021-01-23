

class MovieModel{

  int vote_count;
  int id;
  bool video;
  var vote_average;
  String title;
  double popularity;
  String poster_path;
  String original_language;
  String original_title;
  String backdrop_path;
  bool adult;
  String overview;
  String release_date;

  MovieModel(
    {
      this.adult,
    this.backdrop_path,
    this.id,
    this.original_language,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.release_date,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count
    }
  );

  // MovieModel(
  //   this._adult,
  //   this._backdrop_path,
  //   this._id,
  //   this._original_language,
  //   this._original_title,
  //   this._overview,
  //   this._popularity,
  //   this._poster_path,
  //   this._release_date,
  //   this._title,
  //   this._video,
  //   this._vote_average,
  //   this._vote_count
  // );

  // String getReleaseDate() => _release_date;
  // String getOverview() => _overview;
  // bool getAdult() => _adult;
  // String getBackdropPath() => _backdrop_path;
  // String getOriginalTitle() => _original_title;
  // String getOriginalLanguage() => _original_language;
  // String getPosterPath() => _poster_path;
  // double getPopularity() => _popularity;
  // String getTitle() => _title;
  // double getVoteAverage() => _vote_average;
  // bool getVideo() => _video;
  // int getId() => _id;
  // int getVoteCount() => _vote_count;

}