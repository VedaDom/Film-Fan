import 'package:either_dart/either.dart';
import 'package:filmfan/domain/entities/actor.dart';

import '../../core/error/failures.dart';
import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getFavoriteMovies();
  Future<Either<Failure, Movie>> getMovieDetails(int movieId);
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId);
  Future<Either<Failure, List<Actor>>> getMovieActors(int movieId);
  Future<Either<Failure, String>> rateMovie(int movieId, double rating);
  Future<Either<Failure, String>> addMovieToFavorite(int movieId);
  Future<Either<Failure, List<Movie>>> getRatedMovies();
}
