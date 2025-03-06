import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/common/error/failures.dart';
import '../../../../core/common/usecase/usecase.dart';
import '../entities/sign_up.dart';
import '../repository/auth_repository.dart';

part 'user_sign_up.freezed.dart';
part 'user_sign_up.g.dart';

class PostRegister extends UseCase<SignUp, UserSignUpParams> {
  final AuthRepository _repo;

  PostRegister(this._repo);

  @override
  Future<Either<Failure, SignUp>> call(UserSignUpParams params) =>
      _repo.signUpWithEmailPassword(params: params);
}

@freezed
class UserSignUpParams with _$UserSignUpParams {
  const factory UserSignUpParams({
    @Default("") String username,
    @Default("") String role,
    @Default("") String password,

  }) = _RegisterParams;

  factory UserSignUpParams.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpParamsFromJson(json);
}