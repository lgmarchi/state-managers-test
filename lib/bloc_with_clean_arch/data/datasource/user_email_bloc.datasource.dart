import '../../domain/entities/user_email_bloc.entity.dart';
import '../models/user_email_bloc.model.dart';

abstract class IUserEmailDataSource {
  Future<UserEmail> getUserEmail();
}

/// Here can be a logic to treat
class UserEmailDataSourceImpl implements IUserEmailDataSource {
  @override
  Future<UserEmail> getUserEmail() async {
    try {
      final _result = {
        'body': {'email': 'teste@teste.com.br'},
      };

      final _userEmail = UserEmailModel.fromJson(_result['body']!);

      return _userEmail;
    } catch (error) {
      throw Exception(error as Error);
    }
  }
}
