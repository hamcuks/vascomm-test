import 'package:vascomm_test/features/authentication/domain/entities/login_params.dart';
import 'package:vascomm_test/features/authentication/domain/repository/authentication_repository.dart';

import '../entities/auth_response.dart';

class LoginUsecase {
  final AuthenticationRepository _repository;

  const LoginUsecase(AuthenticationRepository repository)
      : _repository = repository;

  Future<AuthResponse> call(LoginParams data) async {
    try {
      return _repository.login(data);
    } catch (e) {
      rethrow;
    }
  }
}
