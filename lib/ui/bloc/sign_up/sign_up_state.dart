part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {
  const SignUpState();
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final SignUp data;
 const SignUpSuccess(this.data);
}
final class SignUpFailure extends SignUpState {
  final String message;
  const SignUpFailure(this.message);
}