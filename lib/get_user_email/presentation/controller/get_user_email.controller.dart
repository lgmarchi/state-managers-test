import 'package:mobx/mobx.dart';

import '../../domain/entities/email.entity.dart';
import '../../domain/usecases/get_user_email_impl.usecase.dart';

part 'get_user_email.controller.g.dart';

enum GetUserEmailState { initial, loading, success, error }

class GetUserEmailController = _GetUserEmailControllerBase
    with _$GetUserEmailController;

abstract class _GetUserEmailControllerBase with Store {
  final UserEmailGetUseCaseImpl userEmailGetUseCaseImpl;

  _GetUserEmailControllerBase(
    this.userEmailGetUseCaseImpl,
  );

  @observable
  UserEmail? userEmail;

  @observable
  GetUserEmailState _getUserEmailState = GetUserEmailState.initial;

  @computed
  GetUserEmailState get userEmailState => _getUserEmailState;

  @action
  Future<void> getUserEmail() async {
    try {
      _changeGetUserEmailState(GetUserEmailState.loading);
      Future.delayed(const Duration(seconds: 3), () async {
        await userEmailGetUseCaseImpl.call().then(
              (value) => value.rule(
                (failure) => _changeGetUserEmailState(GetUserEmailState.error),
                (success) {
                  userEmail = success;
                  _changeGetUserEmailState(GetUserEmailState.success);
                },
              ),
            );
      });
    } catch (error) {
      _changeGetUserEmailState(GetUserEmailState.error);
    }
  }

  @action
  Future<void> _changeGetUserEmailState(GetUserEmailState newState) async =>
      _getUserEmailState = newState;
}
