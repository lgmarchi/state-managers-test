import 'package:dartz/dartz.dart';
import 'package:mobx_clean_arch/get_user_email/data/datasource/get_user_email.datasource.dart';
import 'package:mobx_clean_arch/get_user_email/domain/entities/email.entity.dart';

import '../../domain/repositories/get_user_email.repository.dart';

class GetUserEmailRepositoryImpl implements IGetUserEmailRepository {
  final IGetUserEmailDataSource _datasource;

  const GetUserEmailRepositoryImpl(this._datasource);

  @override
  Future<Either<Error, UserEmail>> getUserEmail() async {
    try {
      return await _datasource.getUserEmail();
    } catch (error) {
      return Left(error as Error);
    }
  }
}
