import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/no_param_usecase.dart';
import '../entities/movie.dart';
import '../repositories/movies_repository.dart';

class GetNowPlayingMoviesUseCase implements NoParamUseCase<List<Movie>> {
  final MoviesRepository moviesRepository;

  GetNowPlayingMoviesUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await moviesRepository.getNowPlayingMovies();
  }
}
