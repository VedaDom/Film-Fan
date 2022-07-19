import 'package:either_dart/either.dart';
import 'package:filmfan/data/models/movie_model.dart';
import 'package:filmfan/domain/usecases/get_favorite_movies_usecase.dart';
import 'package:filmfan/domain/usecases/get_movie_details_usecase.dart';
import 'package:get/get.dart';

import '../core/error/failures.dart';
import '../domain/entities/actor.dart';
import '../domain/entities/movie.dart';
import '../domain/usecases/add_movie_to_favorite_usecase.dart';
import '../domain/usecases/get_movie_actors_usecase.dart';
import '../domain/usecases/get_now_playing_movies_usecase.dart';
import '../domain/usecases/get_rated_movies_usecase.dart';
import '../domain/usecases/get_similar_movies_usecase.dart';
import '../domain/usecases/rate_movie_usecase.dart';

class MoviesService extends GetxService {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetRatedMoviesUseCase getRatedMoviesUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final RateMovieUseCase rateMovieUseCase;
  final AddMovieToFavoriteUseCase addMovieToFavoritesUseCase;
  final GetMovieActorsUseCase getMovieActorsUseCase;
  final GetFavoriteMoviesUseCase getFavoriteMoviesUseCase;

  MoviesService({
    required this.getNowPlayingMoviesUseCase,
    required this.getRatedMoviesUseCase,
    required this.getSimilarMoviesUseCase,
    required this.getMovieDetailsUseCase,
    required this.rateMovieUseCase,
    required this.addMovieToFavoritesUseCase,
    required this.getMovieActorsUseCase,
    required this.getFavoriteMoviesUseCase,
  });

  List<Movie> nowPlayingMovies = [];
  List<Movie> ratedMovies = [];
  List<Movie> favoriteMovies = [];

  @override
  void onInit() {
    getRatedMovies();
    getFavoriteMovies();
    super.onInit();
  }

  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await getNowPlayingMoviesUseCase();
    if (result.isRight) {
      nowPlayingMovies = result.right;
      nowPlayingMovies.sort((a, b) => a.title.compareTo(b.title));
    }
    return result;
  }

  Future<Either<Failure, List<Movie>>> getRatedMovies() async {
    final result = await getRatedMoviesUseCase();
    if (result.isRight) {
      ratedMovies = result.right;
    }
    return result;
  }

  Future<Either<Failure, List<Movie>>> getFavoriteMovies() async {
    final result = await getFavoriteMoviesUseCase();
    if (result.isRight) {
      favoriteMovies = result.right.reversed.toList();
    }
    return result;
  }

  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId) {
    return getSimilarMoviesUseCase(movieId);
  }

  Future<Either<Failure, Movie>> getMovieDetails(int movieId) {
    return getMovieDetailsUseCase(movieId);
  }

  Future<Either<Failure, String>> rateMovie(Movie movie, double rating) async {
    final result = await rateMovieUseCase(
      RateMovieParams(
        movieId: movie.id,
        rating: rating,
      ),
    );
    if (result.isRight) {
      final index = ratedMovies.indexWhere((element) => element.id == movie.id);
      if (index != -1) {
        ratedMovies[index] = (ratedMovies[index] as MovieModel).copyWith(
          rating: rating,
        );
      } else {
        ratedMovies.add(movie);
      }
    }
    return result;
  }

  Future<Either<Failure, String>> addMovieToFavorites(Movie movie) async {
    final result = await addMovieToFavoritesUseCase(movie.id);
    if (result.isRight) {
      final index = favoriteMovies.indexOf(movie);
      if (index == -1) {
        favoriteMovies.add(movie);
      }
    }
    return result;
  }

  Future<Either<Failure, List<Actor>>> getMovieActors(int movieId) async {
    final result = await getMovieActorsUseCase(movieId);
    return result;
  }
}
