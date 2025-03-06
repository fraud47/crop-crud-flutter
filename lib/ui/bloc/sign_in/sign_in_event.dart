part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}




final class SigningInEvent extends SignInEvent{
  final String email;
  final String password;
  SigningInEvent(
      this.email,
      this.password,
      );
}
