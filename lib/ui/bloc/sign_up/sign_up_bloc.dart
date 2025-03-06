import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../domain/use_case/user_sign_up.dart';
import '../../../core/common/error/failures.dart';
import '../../../domain/entities/sign_up.dart';


part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final PostRegister _signup;
  SignUpBloc(this._signup) : super(SignUpInitial()) {
    on<SignUpEvent>((_, emit) => emit(SignUpLoading()));
    on<SigningUpEvent>(_onAuthSignUp);


}
  void _onAuthSignUp(
      SigningUpEvent event,
      Emitter<SignUpState> emit,
      ) async {
    final res = await _signup(
      UserSignUpParams(
        username: event.email,
        password: event.password,
        role: event.role,
      ),
    );

    res.fold(
          (failure) {
            if (failure is ServerFailure){
              emit(SignUpFailure(failure.message??""));
            };
           },
          (user) => _emitAuthSuccess(user, emit),
    );
  }
  void _emitAuthSuccess(
      SignUp user,
      Emitter<SignUpState> emit,
      ) {
    emit(SignUpSuccess(user));
  }
}
