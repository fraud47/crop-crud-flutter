// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterParamsImpl _$$RegisterParamsImplFromJson(Map<String, dynamic> json) =>
    _$RegisterParamsImpl(
      username: json['username'] as String? ?? "",
      role: json['role'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$$RegisterParamsImplToJson(
        _$RegisterParamsImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'role': instance.role,
      'password': instance.password,
    };
