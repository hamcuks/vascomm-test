import 'package:vascomm_test/features/authentication/domain/entities/auth_response.dart';

class AuthResponseModel extends AuthResponse {
  AuthResponseModel(super.token);

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(json['token']);
  }

  AuthResponse toEntity() {
    return AuthResponse(token);
  }
}
