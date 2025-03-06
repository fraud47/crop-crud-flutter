part of 'token_bloc.dart';

@immutable
sealed class TokenState {
  const TokenState();
}

final class TokenInitial extends TokenState {}
final class TokenLoading extends TokenState {}
final class TokenSuccess extends TokenState {
  const TokenSuccess();
}
final class TokenFailure extends TokenState {
  final String message;
  const TokenFailure(this.message);
}

