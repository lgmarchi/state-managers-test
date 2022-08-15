import 'package:mobx_clean_arch/get_user_email/data/datasource/get_user_email.datasource.dart';
import 'package:mobx_clean_arch/get_user_email/domain/entities/email.entity.dart';

import '../../../core/failure_or_success.dart';
import '../../domain/repositories/get_user_email.repository.dart';

class GetUserEmailRepositoryImpl implements IGetUserEmailRepository {
  final IGetUserEmailDataSource _datasource;

  const GetUserEmailRepositoryImpl(this._datasource);

  @override
  Future<FailureOrSuccess<Error, UserEmail>> getUserEmail() async {
    try {
      return await _datasource.getUserEmail();
    } catch (error) {
      return Failure(error as Error);
    }
  }
}
