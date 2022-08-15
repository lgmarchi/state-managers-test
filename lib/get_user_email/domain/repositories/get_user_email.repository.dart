import 'package:mobx_clean_arch/get_user_email/domain/entities/email.entity.dart';

import '../../../core/failure_or_success.dart';

abstract class IGetUserEmailRepository {
  Future<FailureOrSuccess<Error, UserEmail>> getUserEmail();
}
