part of 'useremail_bloc.dart';

@immutable
abstract class UserEmailState {
  List<Object> get props => [];
}

class UserEmailInitial extends UserEmailState {}

class UserEmailLoading extends UserEmailState {}

class UserEmailSuccess extends UserEmailState {
  final UserEmail userEmail;

  UserEmailSuccess(this.userEmail);

  @override
  List<Object> get props => [userEmail];
}

class UserEmailError extends UserEmailState {}
