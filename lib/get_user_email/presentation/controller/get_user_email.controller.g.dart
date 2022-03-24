// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_email.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetUserEmailController on _GetUserEmailControllerBase, Store {
  Computed<GetUserEmailState>? _$userEmailStateComputed;

  @override
  GetUserEmailState get userEmailState => (_$userEmailStateComputed ??=
          Computed<GetUserEmailState>(() => super.userEmailState,
              name: '_GetUserEmailControllerBase.userEmailState'))
      .value;

  final _$userEmailAtom = Atom(name: '_GetUserEmailControllerBase.userEmail');

  @override
  UserEmail? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(UserEmail? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$_getUserEmailStateAtom =
      Atom(name: '_GetUserEmailControllerBase._getUserEmailState');

  @override
  GetUserEmailState get _getUserEmailState {
    _$_getUserEmailStateAtom.reportRead();
    return super._getUserEmailState;
  }

  @override
  set _getUserEmailState(GetUserEmailState value) {
    _$_getUserEmailStateAtom.reportWrite(value, super._getUserEmailState, () {
      super._getUserEmailState = value;
    });
  }

  final _$getUserEmailAsyncAction =
      AsyncAction('_GetUserEmailControllerBase.getUserEmail');

  @override
  Future<void> getUserEmail() {
    return _$getUserEmailAsyncAction.run(() => super.getUserEmail());
  }

  final _$_changeGetUserEmailStateAsyncAction =
      AsyncAction('_GetUserEmailControllerBase._changeGetUserEmailState');

  @override
  Future<void> _changeGetUserEmailState(GetUserEmailState newState) {
    return _$_changeGetUserEmailStateAsyncAction
        .run(() => super._changeGetUserEmailState(newState));
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
userEmailState: ${userEmailState}
    ''';
  }
}
