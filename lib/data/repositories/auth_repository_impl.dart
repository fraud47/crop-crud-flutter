
import 'package:dartz/dartz.dart';
import 'package:farm_form/data/models/login_response.dart';


import '../../../../core/common/error/failures.dart';
import '../../../../core/hive/hive.dart';
import '../../core/common/entities/token.dart';
import '../../core/common/entities/user.dart';
import '../../domain/entities/sign_up.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/use_case/user_login.dart';
import '../../domain/use_case/user_sign_up.dart';
import '../remote/auth_remote_data_source.dart';

class AuthRepositoryImpl  implements AuthRepository{
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);


  @override
  Future<Either<Failure, User>> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Token>> loginWithEmailPassword({required LoginParams params}) async {
    final response = await authRemoteDatasource.login(params);

    return response.fold(
          (failure) => Left(failure),
          (loginResponse) {
            print('loginres${loginResponse.body?.access}');
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(MainBoxKeys.access_token, loginResponse.body?.access);
        mainBoxMixin.addData(MainBoxKeys.refresh_token, loginResponse.body?.refresh);
        mainBoxMixin.addData(MainBoxKeys.role, loginResponse.body?.role);
        mainBoxMixin.addData(MainBoxKeys.id, loginResponse.body?.id);

        return Right(loginResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, SignUp>> signUpWithEmailPassword({required UserSignUpParams params}) async {
    final response = await authRemoteDatasource.register(params);

    return response.fold(
          (failure) => Left(failure),
          (registerResponse) {
        return Right(registerResponse.toEntity());
      },
    );
  }

  @override
  Future<void> logout() async {
    try {
      await mainBoxMixin.logoutBox();



    } catch (e) {
      throw Exception('Logout failed: ${e.toString()}');
    }

  }
}

