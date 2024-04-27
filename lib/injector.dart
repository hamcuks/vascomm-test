import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vascomm_test/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:vascomm_test/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:vascomm_test/features/authentication/domain/repository/authentication_repository.dart';
import 'package:vascomm_test/features/authentication/domain/usecases/login_usecase.dart';
import 'package:vascomm_test/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';

final sl = GetIt.instance;

void dependencySetup() async {
  /// External Dependencies
  sl.registerSingleton<Dio>(Dio());

  /// Data Sources
  sl.registerSingleton<AuthenticationRemoteDataSource>(
    AuthenticationRemoteDataSourceImpl(sl<Dio>()),
  );

  /// Repositories
  sl.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(
      dataSource: sl<AuthenticationRemoteDataSource>(),
    ),
  );

  /// Usecases
  sl.registerSingleton<LoginUsecase>(
    LoginUsecase(sl<AuthenticationRepository>()),
  );

  /// BLoC
  sl.registerSingleton<LoginBloc>(
    LoginBloc(sl<LoginUsecase>()),
  );
}
