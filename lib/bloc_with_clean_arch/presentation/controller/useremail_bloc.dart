import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../core/usecase.dart';
import '../../domain/entities/user_email_bloc.entity.dart';
import '../../domain/usecases/user_email_bloc.usecase.dart';

part 'useremail_event.dart';
part 'useremail_state.dart';

class UserEmailBloc extends Bloc<UserEmailEvent, UserEmailState> {
  final IUserEmailUseCase _iUserEmailUseCase;

  UserEmailBloc(this._iUserEmailUseCase) : super(UserEmailInitial()) {
    UserEmailBloc(_iUserEmailUseCase).stream.listen((event) {});

    on<GetUserEmail>(
      (event, emit) async {
        try {
          emit(UserEmailLoading());
          final _userEmail = await _iUserEmailUseCase.call();
          emit(UserEmailSuccess(_userEmail));
        } catch (error) {
          emit(UserEmailError());
          addError(error);
        }
      },
    );
  }
}
