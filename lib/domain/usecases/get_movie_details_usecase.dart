import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/pram_usecase.dart';
import '../entities/movie.dart';
import '../repositories/movies_repository.dart';

class GetMovieDetailsUseCase implements ParamUseCase<Movie, int> {
  final MoviesRepository moviesRepository;

  GetMovieDetailsUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, Movie>> call(int movieId) async {
    return await moviesRepository.getMovieDetails(movieId);
  }
}
