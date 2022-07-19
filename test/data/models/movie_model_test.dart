import 'package:filmfan/data/models/movie_model.dart';
import 'package:filmfan/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tMovieModel = MovieModel(
    id: 1,
    title: 'title',
    overview: 'overview',
    posterPath: 'posterPath',
    backdropPath: 'backdropPath',
    releaseDate: 'releaseDate',
    voteAverage: 1.0,
    genres: [],
    rating: 0.0,
  );

  group('MovieModel', () {
    test("should be a subclass of Movie entity", () async {
      // assert
      expect(tMovieModel, isA<Movie>());
    });

    test("should return a valid model from JSON", () async {
      // arrange
      final Map<String, dynamic> jsonData = {
        "id": 1,
        "title": 'title',
        "overview": 'overview',
        "poster_path": 'posterPath',
        "backdrop_path": 'backdropPath',
        "release_date": 'releaseDate',
        "vote_average": 1.0,
        "genres": [],
        "rating": 0.0,
      };

      // act
      final result = MovieModel.fromJson(jsonData);

      // assert
      expect(result, tMovieModel);
    });

    test("should return a JSON map from a valid model", () async {
      // act
      final result = tMovieModel.toJson();

      // assert
      final expectedMap = {
        "id": 1,
        "title": 'title',
        "overview": 'overview',
        "poster_path": 'posterPath',
        "backdrop_path": 'backdropPath',
        "release_date": 'releaseDate',
        "vote_average": 1.0,
        "genres": [],
        "rating": 0.0,
      };
      expect(result, expectedMap);
    });

    test("should return a copy of the model with new rating", () async {
      // arrange
      const expected = MovieModel(
        id: 1,
        title: 'title',
        overview: 'overview',
        posterPath: 'posterPath',
        backdropPath: 'backdropPath',
        releaseDate: 'releaseDate',
        voteAverage: 1.0,
        genres: [],
        rating: 1.0,
      );

      // act
      final result = tMovieModel.copyWith(rating: 1.0);

      // assert
      expect(result, expected);
    });
  });
}
