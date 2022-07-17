import 'package:either_dart/either.dart';

import '../error/failures.dart';

abstract class ParamUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
