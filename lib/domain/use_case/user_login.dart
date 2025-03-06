import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/common/error/failures.dart';
import '../../../../core/common/usecase/usecase.dart';
import '../../core/common/entities/token.dart';
import '../repository/auth_repository.dart';

part 'user_login.freezed.dart';
part 'user_login.g.dart';

class PostLogin extends UseCase<Token, LoginParams> {
  final AuthRepository _repo;

  PostLogin(this._repo);

  @override
  Future<Either<Failure, Token>> call(LoginParams params) =>
      _repo.loginWithEmailPassword(params: params);
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default("") String username,
    @Default("") String password,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
