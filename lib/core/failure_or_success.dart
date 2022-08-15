/// It is a functional error handling to return Failure in left side or a Success in the right side
abstract class FailureOrSuccess<F, S> {
  const FailureOrSuccess();

  /// [rule] is a method to treat the value returned
  /// when it is a [Failure] or [Success]
  ///
  /// Example:
  /// ```dart
  /// await userEmailGetUseCaseImpl.call().then(
  ///            (value) => value.rule(
  ///              (failure) => _changeGetUserEmailState(GetUserEmailState.error),
  ///              (success) {
  ///                userEmail = success;
  ///                _changeGetUserEmailState(GetUserEmailState.success);
  ///              },
  ///            ),
  ///          );
  /// ```
  R rule<R>(R Function(F failure) ifFailure, R Function(S success) ifSuccess);

  bool isFailure() => rule((_) => true, (_) => false);
  bool isSuccess() => rule((_) => false, (_) => true);

  @override
  String toString() => rule((f) => 'Failure($f)', (s) => 'Success($s)');
}

class Failure<F, S> extends FailureOrSuccess<F, S> {
  final F _f;
  const Failure(this._f);
  F get value => _f;
  @override
  R rule<R>(R Function(F f) ifFailure, R Function(S s) ifSuccess) =>
      ifFailure(_f);
  @override
  bool operator ==(other) => other is Failure && other._f == _f;
  @override
  int get hashCode => _f.hashCode;
}

class Success<F, S> extends FailureOrSuccess<F, S> {
  final S _s;
  const Success(this._s);
  S get value => _s;
  @override
  R rule<R>(R Function(F f) ifFailure, R Function(S s) ifSuccess) =>
      ifSuccess(_s);
  @override
  bool operator ==(other) => other is Success && other._s == _s;
  @override
  int get hashCode => _s.hashCode;
}
