import 'package:either_dart/either.dart';
import 'package:filmfan/core/usecases/pram_usecase.dart';

import '../../core/error/failures.dart';
import '../entities/actor.dart';
import '../repositories/movies_repository.dart';

class GetMovieActorsUseCase implements ParamUseCase<List<Actor>, int> {
  final MoviesRepository moviesRepository;

  GetMovieActorsUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Actor>>> call(int movieId) async {
    return await moviesRepository.getMovieActors(movieId);
  }
}
