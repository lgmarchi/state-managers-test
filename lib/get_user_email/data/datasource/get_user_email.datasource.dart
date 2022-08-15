import '../../../core/failure_or_success.dart';
import '../../domain/entities/email.entity.dart';

abstract class IGetUserEmailDataSource {
  Future<FailureOrSuccess<Error, UserEmail>> getUserEmail();
}
