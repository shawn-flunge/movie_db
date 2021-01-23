

class MovieModel{

  int voteCount;
  int id;
  bool video;
  var voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;
  List<String> genress;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.genress
  });


    

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