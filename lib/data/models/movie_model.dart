import 'package:filmfan/data/models/genre_model.dart';
import 'package:filmfan/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.backdropPath,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.genres,
    required super.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: double.parse(json['vote_average'].toString()),
      genres: json['genres'] != null
          ? (json['genres'] as List<dynamic>)
              .map((e) => GenreModel.fromJson(e))
              .toList()
          : null,
      rating:
          json['rating'] != null ? double.parse(json['rating'].toString()) : 0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['backdrop_path'] = backdropPath;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    if (genres != null) {
      data['genres'] = genres!.map((v) => (v as GenreModel).toJson()).toList();
    }
    data['rating'] = rating;
    return data;
  }
}
