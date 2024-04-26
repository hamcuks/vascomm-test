import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vascomm_test/features/authentication/data/models/auth_response_model.dart';
import 'package:vascomm_test/features/authentication/domain/entities/login_params.dart';

abstract class AuthenticationRepository {
  /// Requries [data] params with [LoginParams] type
  Future<AuthResponseModel> login(LoginParams data);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Dio _dio;

  const AuthenticationRepositoryImpl(Dio dio) : _dio = dio;

  @override
  Future<AuthResponseModel> login(LoginParams data) async {
    try {
      final response = await _dio.post(
        'https://reqres.in/api/login',
        data: {
          'email': data.email,
          'password': data.password,
        },
      );

      return AuthResponseModel.fromJson(response.data);
    } catch (e) {
      /// Return general error message in release mode
      if (!kDebugMode) throw 'Terjadi kesalahan saat melakukan login';

      rethrow;
    }
  }
}
