import '../../domain/entities/email.entity.dart';

class UserEmailModel extends UserEmail {
  UserEmailModel(String email) : super(email);

  static UserEmail fromJson(Map<String, dynamic> json) {
    return UserEmail(json['email']);
  }
}
