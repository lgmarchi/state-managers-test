import 'package:mobx_clean_arch/get_user_email/domain/entities/email.entity.dart';
import 'package:mobx_clean_arch/get_user_email/domain/repositories/get_user_email.repository.dart';
import 'package:mobx_clean_arch/get_user_email/domain/usecases/get_user_email.usecase.dart';

import '../../../core/failure_or_success.dart';

class UserEmailGetUseCaseImpl implements IGetUserEmailUseCase {
  final IGetUserEmailRepository _repository;

  const UserEmailGetUseCaseImpl(this._repository);

  @override
  Future<FailureOrSuccess<Error, UserEmail>> call() async =>
      await _repository.getUserEmail();
}
