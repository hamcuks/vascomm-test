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
  final String? message;

  const LoginState({
    this.status = LoginStatus.initial,
    this.message,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status];
}
