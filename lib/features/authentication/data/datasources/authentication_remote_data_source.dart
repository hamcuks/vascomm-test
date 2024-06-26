import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vascomm_test/features/authentication/data/models/auth_response_model.dart';
import 'package:vascomm_test/features/authentication/domain/entities/login_params.dart';

abstract class AuthenticationRemoteDataSource {
  /// Requries [data] params with [LoginParams] type
  Future<AuthResponseModel> login(LoginParams data);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final Dio _dio;

  const AuthenticationRemoteDataSourceImpl(Dio dio) : _dio = dio;

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
    } on DioException catch (e) {
      /// Throw error message from API if error not null.
      /// Otherwise, return error type of DioExecption
      throw e.response?.data?['error'] ?? e.type;
    } catch (e) {
      /// Return general error message in release mode
      if (!kDebugMode) throw 'Terjadi kesalahan saat melakukan login';

      rethrow;
    }
  }
}
