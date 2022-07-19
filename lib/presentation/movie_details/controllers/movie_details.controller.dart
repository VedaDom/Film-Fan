import 'package:filmfan/domain/entities/actor.dart';
import 'package:get/get.dart';

import '../../../domain/entities/movie.dart';
import '../../movies.service.dart';

class MovieDetailsController extends GetxController with StateMixin<Movie> {
  List<Movie> similarMovies = [];
  List<Actor> actors = [];
  var ratings = 0.0.obs;
  var isFavorite = false.obs;

  @override
  void onInit() {
    getMovieDetails();
    super.onInit();
  }

  Future<void> rateMovie(Movie movie, double rating) async {
    final response = await Get.find<MoviesService>().rateMovie(movie, rating);
    if (response.isRight) {
      ratings.value = rating;
    }
  }

  Future<void> addToFavorite(Movie movie) async {
    final response = await Get.find<MoviesService>().addMovieToFavorites(movie);
    if (response.isRight) {
      isFavorite.value = true;
    }
  }

  Future<void> getMovieDetails() async {
    final int movieId = Get.arguments;
    change(null, status: RxStatus.loading());
    final response = await Get.find<MoviesService>().getMovieDetails(
      movieId,
    );

    final similarMoviesResponse =
        await Get.find<MoviesService>().getSimilarMovies(
      movieId,
    );
    if (similarMoviesResponse.isRight) {
      similarMovies = similarMoviesResponse.right;
    }

    final actorsResponse = await Get.find<MoviesService>().getMovieActors(
      movieId,
    );
    if (actorsResponse.isRight) {
      actors = actorsResponse.right;
    }

    if (Get.find<MoviesService>().ratedMovies.isNotEmpty) {
      final movie = Get.find<MoviesService>()
          .ratedMovies
          .where((element) => element.id == movieId)
          .toList();
      if (movie.isNotEmpty) {
        ratings.value = movie.first.rating;
      }
    }

    if (Get.find<MoviesService>().favoriteMovies.isNotEmpty) {
      final isNotEmpty = Get.find<MoviesService>()
          .favoriteMovies
          .where((element) => element.id == movieId)
          .isNotEmpty;
      isFavorite.value = isNotEmpty;
    }

    if (response.isRight) {
      change(response.right, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error("Error occured, try again later."));
    }
  }
}
