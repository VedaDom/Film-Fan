import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class NoParamUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
