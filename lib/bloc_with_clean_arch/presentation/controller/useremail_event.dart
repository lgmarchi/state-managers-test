part of 'useremail_bloc.dart';

@immutable
abstract class UserEmailEvent {
  List<Object> get props => [];
}

class GetUserEmail extends UserEmailEvent {
  @override
  List<Object> get props => [];
}
