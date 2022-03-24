import 'package:dartz/dartz.dart';
import 'package:mobx_clean_arch/get_user_email/domain/entities/email.entity.dart';

abstract class IGetUserEmailRepository {
  Future<Either<Error, UserEmail>> getUserEmail();
}
