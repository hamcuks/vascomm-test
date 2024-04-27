import 'package:vascomm_test/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:vascomm_test/features/authentication/domain/entities/auth_response.dart';
import 'package:vascomm_test/features/authentication/domain/entities/login_params.dart';
import 'package:vascomm_test/features/authentication/domain/repository/authentication_repository.dart';

/// In this repository implementation we can execute data caching (optional)
/// or get data from data soruce based on connection state
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _dataSource;

  const AuthenticationRepositoryImpl({
    required AuthenticationRemoteDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<AuthResponse> login(LoginParams data) async {
    try {
      /// Exec the login function from remote data source
      final source = await _dataSource.login(data);

      /// We also can store user access token in local storage. But, in this
      /// case, we not implemented in

      return source.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
