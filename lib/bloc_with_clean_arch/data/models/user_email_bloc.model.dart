import '../../domain/entities/user_email_bloc.entity.dart';

class UserEmailModel extends UserEmail {
  UserEmailModel(String email) : super(email);

  factory UserEmailModel.fromJson(Map<String, dynamic> json) {
    return UserEmailModel(
      json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
