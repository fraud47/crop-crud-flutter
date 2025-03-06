import 'package:dartz/dartz.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/api/list_api.dart';
import '../../../../core/common/error/failures.dart';
import '../../domain/use_case/user_login.dart';
import '../../domain/use_case/user_sign_up.dart';
import '../models/login_response.dart';
import '../models/sign_up_response.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, SignUpResponse>> register(
      UserSignUpParams registerParams,
      );

  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, SignUpResponse>> register(
      UserSignUpParams registerParams,
      ) async {
    final response = await _client.postRequest(
      ListAPI.register,
      data: registerParams.toJson(),
      converter: (response) =>
          SignUpResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams) async {
    print(loginParams.toJson().toString());
    final response = await _client.postRequest(
      ListAPI.login,
      data: loginParams.toJson(),
      converter: (response) =>
          LoginResponse.fromJson(response as Map<String, dynamic>),
    );



    return response;
  }
}