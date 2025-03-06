import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/common/entities/token.dart';
import '../../../../core/common/error/failures.dart';
import '../../../../domain/use_case/user_login.dart';




part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final PostLogin _login;
  SignInBloc(this._login) : super(SignInInitial()) {
    on<SignInEvent>((_, emit) => emit(SignInLoading()));
    on<SigningInEvent>(_onAuthSignIn);


  }
  void _onAuthSignIn(
      SigningInEvent event,
      Emitter<SignInState> emit,
      ) async {
    final res = await _login(
      LoginParams(
        username: event.email,
        password: event.password,
      ),
    );

    res.fold(
          (failure) {
        if (failure is ServerFailure){
          emit(SignInFailure(failure.message??""));
        };
      },
          (token) => _emitAuthSuccess(token, emit),
    );
  }
  void _emitAuthSuccess(
      Token token,
      Emitter<SignInState> emit,
      ) {

    emit(SignInSuccess(token));
  }



}
