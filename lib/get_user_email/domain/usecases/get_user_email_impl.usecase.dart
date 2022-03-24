import 'package:mobx_clean_arch/get_user_email/domain/entities/email.entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx_clean_arch/get_user_email/domain/repositories/get_user_email.repository.dart';
import 'package:mobx_clean_arch/get_user_email/domain/usecases/get_user_email.usecase.dart';

class UserEmailGetUseCaseImpl implements IGetUserEmailUseCase {
  final IGetUserEmailRepository _repository;

  const UserEmailGetUseCaseImpl(this._repository);

  @override
  Future<Either<Error, UserEmail>> call() async =>
      await _repository.getUserEmail();
}
