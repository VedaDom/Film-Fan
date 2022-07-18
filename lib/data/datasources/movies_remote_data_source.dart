import 'package:filmfan/constants.dart';
import 'package:filmfan/data/models/actor_model.dart';
import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../models/movie_model.dart';

abstract class MoviesRemoteDataSource {
  /// Calls the https://xxx/3/movie/now_playing endpoint
  /// to get now playing movies.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getNowPlayingMovies();

  /// Calls the https://xxx/3/account/{ACCOUNT_ID}/favorite/movies endpoint
  /// to get favorite movies.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getFavoriteMovies();

  /// Calls the https://xxx/3/movie/{MOVIE_ID} endpoint
  /// to get a movie details.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieModel> getMovieDetails(int movieId);

  /// Calls the https://xxx/3/movie/{MOVIE_ID}/similar endpoint
  /// to get similar movies.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getSimilarMovies(int movieId);

  /// Calls the https://xxx/3/movie/{MOVIE_ID}/credits endpoint
  /// to get movie actors.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ActorModel>> getMovieActors(int movieId);

  /// Calls the https://xxx/3/movie/{MOVIE_ID}/rating endpoint
  /// to rate a movie.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> rateMovie(int movieId, double rating);

  /// Calls the https://xxx/3/account/{ACCOUNT_ID}/favorite endpoint
  /// to add movie to favorite movies.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> addMovieToFavorite(int movieId);

  /// Calls the https://xxx/3/account/{ACCOUNT_ID}/rated/movies endpoint
  /// to get rated movies.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getRatedMovies();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  // @override
  // void onInit() {
  //   // httpClient.baseUrl = Constants.BASE_URL;
  //   httpClient.defaultContentType = 'application/json';
  //   httpClient.addRequestModifier<Object?>((request) {
  //     request.url.queryParametersParameters.addAll({
  //       'api_key': Constants.API_KEY,
  //     });
  //     return request;
  //   });
  //   super.onInit();
  // }

  final client = Dio(
    BaseOptions(
      baseUrl: Constants.BASE_URL,
      queryParameters: {
        "api_key": Constants.API_KEY,
      },
    ),
  );

  @override
  Future<String> addMovieToFavorite(int movieId) async {
    final response = await client.post(
      '/3/account/${Constants.ACCOUNT_ID}/favorite',
      data: {
        'media_type': 'movie',
        'media_id': movieId,
        'favorite': true,
      },
      queryParameters: {
        "session_id": Constants.SESSION_ID,
      },
    );
    if (response.statusCode == 201) {
      return response.data["status_message"];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    final response = await client.get(
      '/3/account/${Constants.ACCOUNT_ID}/favorite/movies',
      queryParameters: {
        "session_id": Constants.SESSION_ID,
      },
    );
    if (response.statusCode == 200) {
      return (response.data["results"] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ActorModel>> getMovieActors(int movieId) async {
    final response = await client.get(
      '/3/movie/$movieId/credits',
      queryParameters: {
        "session_id": Constants.SESSION_ID,
      },
    );
    if (response.statusCode == 200) {
      return (response.data["cast"] as List<dynamic>)
          .map((e) => ActorModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieModel> getMovieDetails(int movieId) async {
    final response = await client.get(
      '/3/movie/$movieId',
    );
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await client.get(
      '/3/movie/now_playing',
      queryParameters: {
        'page': 1,
      },
    );
    if (response.statusCode == 200) {
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .cast<MovieModel>()
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getRatedMovies() async {
    final response = await client.get(
      '/3/account/${Constants.ACCOUNT_ID}/rated/movies',
      queryParameters: {
        "session_id": Constants.SESSION_ID,
      },
    );
    if (response.statusCode == 200) {
      return (response.data["results"] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int movieId) async {
    final response = await client.get(
      '/3/movie/$movieId/similar',
      queryParameters: {
        "session_id": Constants.SESSION_ID,
      },
    );
    if (response.statusCode == 200) {
      return (response.data["results"] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> rateMovie(int movieId, double rating) async {
    final response = await client.post(
      '/3/movie/$movieId/rating',
      data: {
        'value': rating,
      },
      queryParameters: {
        "session_id": Constants.SESSION_ID,
      },
    );
    if (response.statusCode == 201) {
      return response.data["status_message"];
    } else {
      throw ServerException();
    }
  }
}
