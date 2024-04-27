import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vascomm_test/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:vascomm_test/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:vascomm_test/features/authentication/domain/repository/authentication_repository.dart';
import 'package:vascomm_test/features/authentication/domain/usecases/login_usecase.dart';

final sl = GetIt.instance;

void dependencySetup() {
  /// External Dependencies
  sl.registerSingleton<Dio>(Dio());
  sl.registerFactoryAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

  /// Data Sources
  sl.registerSingleton<AuthenticationRemoteDataSource>(
    AuthenticationRemoteDataSourceImpl(sl<Dio>()),
  );

  /// Repositories
  sl.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(
      dataSource: sl<AuthenticationRemoteDataSource>(),
      sharedPreferences: sl<SharedPreferences>(),
    ),
  );

  /// Usecases
  sl.registerSingleton<LoginUsecase>(
    LoginUsecase(sl<AuthenticationRepository>()),
  );

  /// BLoC
}
