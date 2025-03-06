part of 'token_bloc.dart';

@immutable
sealed class TokenEvent {}
class CheckLoginStatus extends TokenEvent {}