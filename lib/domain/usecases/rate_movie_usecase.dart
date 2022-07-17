import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/pram_usecase.dart';
import '../repositories/movies_repository.dart';

class RateMovieUseCase implements ParamUseCase<String, RateMovieParams> {
  final MoviesRepository moviesRepository;

  RateMovieUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, String>> call(RateMovieParams params) async {
    return await moviesRepository.rateMovie(params.movieId, params.rating);
  }
}

class RateMovieParams extends Equatable {
  final int movieId;
  final double rating;

  const RateMovieParams({required this.movieId, required this.rating});

  @override
  List<Object?> get props => [movieId, rating];
}
