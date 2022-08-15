import '../../domain/entities/user_email_bloc.entity.dart';
import '../../domain/repositories/user_email_bloc.repository.dart';
import '../datasource/user_email_bloc.datasource.dart';

/// In this part, is also good to have logic to verify if the return is what we want
class UserEmailRepositoryImpl implements IUserEmailRepository {
  final IUserEmailDataSource _datasource;

  const UserEmailRepositoryImpl(this._datasource);

  @override
  Future<UserEmail> getUserEmail() async {
    try {
      return await _datasource.getUserEmail();
    } catch (error) {
      rethrow;
    }
  }
}
