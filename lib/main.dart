import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_clean_arch/get_user_email/data/api/get_user_email_impl.datasource.api.dart';
import 'package:mobx_clean_arch/get_user_email/data/datasource/get_user_email.datasource.dart';
import 'package:mobx_clean_arch/get_user_email/data/repositories/get_user_email_impl.repository.dart';
import 'package:mobx_clean_arch/get_user_email/domain/repositories/get_user_email.repository.dart';
import 'package:mobx_clean_arch/get_user_email/domain/usecases/get_user_email.usecase.dart';

import 'bloc_with_clean_arch/domain/usecases/user_email_bloc.usecase.dart';
import 'get_user_email/domain/usecases/get_user_email_impl.usecase.dart';
import 'get_user_email/presentation/controller/get_user_email.controller.dart';
import 'get_user_email/presentation/pages/show_user_email.dart';

void main() {
  _registerDependencies();
  runApp(const MyApp());
}

void _registerDependencies() {
  GetIt getIt = GetIt.I;

  /// Dependency Injection for GetUserEmail feature
  getIt
    ..registerLazySingleton<IGetUserEmailUseCase>(
      () => UserEmailGetUseCaseImpl(getIt()),
    )
    ..registerLazySingleton<IUserEmailUseCase>(
      () => UserEmailUseCase(getIt()),
    )
    ..registerLazySingleton<IGetUserEmailRepository>(
      () => GetUserEmailRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<IGetUserEmailDataSource>(
      () => GetUserEmailDataSourceImplApi(),
    )
    ..registerLazySingleton<GetUserEmailController>(
      () => GetUserEmailController(
        UserEmailGetUseCaseImpl(
          getIt(),
        ),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowUserEmail(),
    );
  }
}
