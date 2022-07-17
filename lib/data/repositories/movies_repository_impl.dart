import 'package:filmfan/data/datasources/movies_remote_data_source.dart';
import 'package:filmfan/domain/entities/actor.dart';
import 'package:filmfan/domain/entities/movie.dart';

import 'package:filmfan/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../core/network/network_info.dart';
import '../../domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final NetworkInfo networkInfo;
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, String>> addMovieToFavorite(int movieId) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.addMovieToFavorite(movieId);
      return Right(response);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getFavoriteMovies() async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.getFavoriteMovies();
      return Right(response);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Actor>>> getMovieActors(int movieId) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.getMovieActors(movieId);
      return Right(response);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails(int movieId) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.getMovieDetails(movieId);
      return Right(response);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.getNowPlayingMovies();
      return Right(response);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getRatedMovies() async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.getRatedMovies();
      return Right(response);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.getSimilarMovies(movieId);
      return Right(response);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, String>> rateMovie(int movieId, double rating) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.rateMovie(movieId, rating);
      return Right(response);
    } else {
      return Left(NetworkFailure());
    }
  }
}
