import 'package:filmfan/data/datasources/movies_remote_data_source.dart';
import 'package:filmfan/data/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MoviesRemoteDataSourceImpl moviesRemoteDataSourceImpl;

  setUp(() {
    moviesRemoteDataSourceImpl = MoviesRemoteDataSourceImpl();
  });

  group('MoviesRemoteDataSourceImpl', () {
    group('getNowPlayingMovies', () {
      test('should return a list of now playing movies', () async {
        // arrange
        when(moviesRemoteDataSourceImpl.getNowPlayingMovies()).thenAnswer(
          (_) async => [
            const MovieModel(
              id: 1,
              title: 'title',
              overview: 'overview',
              posterPath: 'posterPath',
              backdropPath: 'backdropPath',
              releaseDate: 'releaseDate',
              voteAverage: 1.0,
              genres: [],
              rating: 0.0,
            ),
          ],
        );
        // act
        final result = await moviesRemoteDataSourceImpl.getNowPlayingMovies();
        // assert
        expect(result, [
          const MovieModel(
            id: 1,
            title: 'title',
            overview: 'overview',
            posterPath: 'posterPath',
            backdropPath: 'backdropPath',
            releaseDate: 'releaseDate',
            voteAverage: 1.0,
            genres: [],
            rating: 0.0,
          ),
        ]);
      });
    });
  });
}
