import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/repository/auth_repository.dart';
import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRepository authRepository;

  LogoutBloc( this.authRepository) : super(const LogoutInitial()) {
    on<LogoutRequested>(_onLogoutRequested);
  }

  FutureOr<void> _onLogoutRequested(
      LogoutRequested event,
      Emitter<LogoutState> emit,
      ) async {
    emit(const LogoutLoading());

    try {
      await authRepository.logout();
      emit(const LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}