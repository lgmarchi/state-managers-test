import 'package:dartz/dartz.dart';

import '../../domain/entities/email.entity.dart';

abstract class IGetUserEmailDataSource {
  Future<Either<Error, UserEmail>> getUserEmail();
}
