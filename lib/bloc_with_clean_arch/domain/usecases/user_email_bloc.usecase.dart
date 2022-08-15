import '../entities/user_email_bloc.entity.dart';
import '../repositories/user_email_bloc.repository.dart';

abstract class IUserEmailUseCase {
  Future<UserEmail> call();
}

class UserEmailUseCase implements IUserEmailUseCase {
  final IUserEmailRepository _repository;

  const UserEmailUseCase(this._repository);

  @override
  Future<UserEmail> call() async => await _repository.getUserEmail();
}
