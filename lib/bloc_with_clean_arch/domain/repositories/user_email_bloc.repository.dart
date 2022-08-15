import '../entities/user_email_bloc.entity.dart';

abstract class IUserEmailRepository {
  Future<UserEmail> getUserEmail();
}
