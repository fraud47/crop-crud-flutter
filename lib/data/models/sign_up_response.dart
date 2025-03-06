import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/sign_up.dart';

part 'sign_up_response.freezed.dart';
part 'sign_up_response.g.dart';

@freezed
class SignUpResponse with _$SignUpResponse {
  const factory SignUpResponse({
    int? id,
    String? name,
    String? email,
    String? error,
  }) = _SignUpResponse;

  const SignUpResponse._();

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  SignUp toEntity() => SignUp(id: id,name: name, email: email);
}