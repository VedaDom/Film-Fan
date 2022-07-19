import 'genre.dart';
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String? backdropPath;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final List<Genre>? genres;
  final double rating;

  const Movie({
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

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        genres,
        rating,
      ];
}
