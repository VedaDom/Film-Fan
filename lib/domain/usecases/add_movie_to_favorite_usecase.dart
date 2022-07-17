import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/pram_usecase.dart';
import '../repositories/movies_repository.dart';

class AddMovieToFavoriteUseCase implements ParamUseCase<String, int> {
  final MoviesRepository moviesRepository;

  AddMovieToFavoriteUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, String>> call(int movieId) async {
    return await moviesRepository.addMovieToFavorite(movieId);
  }
}
