import 'genre.dart';

class Movie {
  final int id;
  final String? backdropPath;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  List<Genre>? genres;
  late final double rating;

  Movie({
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.genres,
    required this.rating,
  });

  factory Movie.empty() {
    return Movie(
      id: 0,
      backdropPath: null,
      overview: '',
      posterPath: '',
      releaseDate: '',
      title: '',
      voteAverage: 0,
      genres: null,
      rating: 0,
    );
  }
}
