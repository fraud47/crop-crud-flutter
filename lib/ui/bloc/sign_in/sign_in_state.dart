part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {
  const SignInState();
}

final class SignInInitial extends SignInState {}
final class SignInLoading extends SignInState {}
final class SignInSuccess extends SignInState {
  final Token data;
  const SignInSuccess(this.data);
}
final class SignInFailure extends SignInState {
  final String message;
  const SignInFailure(this.message);
}

