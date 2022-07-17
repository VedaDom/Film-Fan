import 'package:either_dart/either.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/pram_usecase.dart';
import '../entities/movie.dart';
import '../repositories/movies_repository.dart';

class GetSimilarMoviesUseCase implements ParamUseCase<List<Movie>, int> {
  final MoviesRepository moviesRepository;

  GetSimilarMoviesUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(int movieId) async {
    return await moviesRepository.getSimilarMovies(movieId);
  }
}
