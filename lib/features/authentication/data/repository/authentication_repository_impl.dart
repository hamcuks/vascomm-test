import 'package:shared_preferences/shared_preferences.dart';
import 'package:vascomm_test/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:vascomm_test/features/authentication/domain/entities/auth_response.dart';
import 'package:vascomm_test/features/authentication/domain/entities/login_params.dart';
import 'package:vascomm_test/features/authentication/domain/repository/authentication_repository.dart';

/// In this repository implementation we can execute data caching (optional)
/// or get data from data soruce based on connection state
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _dataSource;
  final SharedPreferences _sharedPreferences;

  const AuthenticationRepositoryImpl({
    required AuthenticationRemoteDataSource dataSource,
    required SharedPreferences sharedPreferences,
  })  : _dataSource = dataSource,
        _sharedPreferences = sharedPreferences;

  @override
  Future<AuthResponse> login(LoginParams data) async {
    try {
      /// Exec the login function from remote data source
      final source = await _dataSource.login(data);

      /// Save token data into shared preference
      await _sharedPreferences.setString('token', source.token);

      return source.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
