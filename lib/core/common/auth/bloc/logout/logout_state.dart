import 'package:equatable/equatable.dart';




abstract class LogoutState extends Equatable{
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {
  const LogoutInitial();
}

class LogoutLoading extends LogoutState {
  const LogoutLoading();
}

class LogoutSuccess extends LogoutState {
  const LogoutSuccess();
}

class LogoutFailure extends LogoutState {
  final String error;

  const LogoutFailure(this.error);

  @override
  List<Object> get props => [error];
}