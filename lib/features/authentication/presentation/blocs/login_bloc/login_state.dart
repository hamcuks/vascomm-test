part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failed }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;
  bool get isLoading => this == LoginStatus.loading;
  bool get isSuccess => this == LoginStatus.success;
  bool get isFailed => this == LoginStatus.failed;
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String data;
  final String? message;

  const LoginState({
    this.status = LoginStatus.initial,
    this.data = '',
    this.message,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? data,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, data];
}
