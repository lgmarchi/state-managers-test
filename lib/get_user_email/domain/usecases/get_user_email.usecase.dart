import 'package:dartz/dartz.dart';

import '../entities/email.entity.dart';

abstract class IGetUserEmailUseCase {
  Future<Either<Error, UserEmail>> call();
}
