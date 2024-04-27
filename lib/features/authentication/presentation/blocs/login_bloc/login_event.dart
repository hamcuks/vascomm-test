part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEventPressed extends LoginEvent {
  final LoginParams data;

  const LoginEventPressed(this.data);
}
