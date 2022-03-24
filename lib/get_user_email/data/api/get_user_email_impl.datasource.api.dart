import 'package:mobx_clean_arch/get_user_email/domain/entities/email.entity.dart';

import 'package:dartz/dartz.dart';

import '../datasource/get_user_email.datasource.dart';
import '../models/email.model.dart';

class GetUserEmailDataSourceImplApi implements IGetUserEmailDataSource {
  @override
  Future<Either<Error, UserEmail>> getUserEmail() async {
    try {
      final _result = {
        'body': {'email': 'teste@teste.com.br'},
      };

      final _userEmail = UserEmailModel.fromJson(_result['body']!);

      return Right(_userEmail);
    } catch (error) {
      return Left(error as Error);
    }
  }
}
