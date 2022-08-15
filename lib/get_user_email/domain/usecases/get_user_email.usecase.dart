import '../../../core/failure_or_success.dart';
import '../entities/email.entity.dart';

abstract class IGetUserEmailUseCase {
  Future<FailureOrSuccess<Error, UserEmail>> call();
}
