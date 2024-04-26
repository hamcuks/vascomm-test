import 'package:vascomm_test/features/authentication/domain/entities/login_params.dart';

import '../entities/auth_response.dart';

abstract class AuthenticationRepository {
  Future<AuthResponse> login(LoginParams data);
}
