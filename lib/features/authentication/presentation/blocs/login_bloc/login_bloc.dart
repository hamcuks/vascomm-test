import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vascomm_test/features/authentication/domain/entities/login_params.dart';
import 'package:vascomm_test/features/authentication/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _usecase;

  LoginBloc(LoginUsecase usecase)
      : _usecase = usecase,
        super(const LoginState()) {
    on<LoginEventPressed>(_onLoginEventPressed);
  }

  void _onLoginEventPressed(
    LoginEventPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      /// Emit status to loading when this event triggered
      emit(state.copyWith(status: LoginStatus.loading));

      /// Exec login usecase and pass the LoginParams data
      final usecase = await _usecase(event.data);

      /// Emit status to success if there is no error occurred
      emit(state.copyWith(status: LoginStatus.success, data: usecase.token));
    } catch (e) {
      /// Emit status to failed if error occurred
      emit(
        state.copyWith(
          status: LoginStatus.failed,
          message: e.toString(),
        ),
      );
    }
  }
}
