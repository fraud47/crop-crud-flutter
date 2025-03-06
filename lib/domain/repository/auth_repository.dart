



import '../../../../core/common/entities/token.dart';
import '../../../../core/common/entities/user.dart';
import '../../../../core/common/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../entities/sign_up.dart';
import '../use_case/user_login.dart';
import '../use_case/user_sign_up.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, SignUp>> signUpWithEmailPassword({
    required UserSignUpParams params
  });
  Future<Either<Failure, Token>> loginWithEmailPassword({
    required LoginParams params,

  });
  Future<Either<Failure, User>> currentUser();
  Future<void> logout();
}
