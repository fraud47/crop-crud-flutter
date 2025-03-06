// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_roled, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sign_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSignUpParams _$UserSignUpParamsFromJson(Map<String, dynamic> json) {
  return _RegisterParams.fromJson(json);
}

/// @nodoc
mixin _$UserSignUpParams {
  String get username => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSignUpParamsCopyWith<UserSignUpParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSignUpParamsCopyWith<$Res> {
  factory $UserSignUpParamsCopyWith(
          UserSignUpParams value, $Res Function(UserSignUpParams) then) =
      _$UserSignUpParamsCopyWithImpl<$Res, UserSignUpParams>;
  @useResult
  $Res call({String username, String role, String password});
}

/// @nodoc
class _$UserSignUpParamsCopyWithImpl<$Res, $Val extends UserSignUpParams>
    implements $UserSignUpParamsCopyWith<$Res> {
  _$UserSignUpParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? role = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterParamsImplCopyWith<$Res>
    implements $UserSignUpParamsCopyWith<$Res> {
  factory _$$RegisterParamsImplCopyWith(_$RegisterParamsImpl value,
          $Res Function(_$RegisterParamsImpl) then) =
      __$$RegisterParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String role, String password});
}

/// @nodoc
class __$$RegisterParamsImplCopyWithImpl<$Res>
    extends _$UserSignUpParamsCopyWithImpl<$Res, _$RegisterParamsImpl>
    implements _$$RegisterParamsImplCopyWith<$Res> {
  __$$RegisterParamsImplCopyWithImpl(
      _$RegisterParamsImpl _value, $Res Function(_$RegisterParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? role = null,
    Object? password = null,
  }) {
    return _then(_$RegisterParamsImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterParamsImpl implements _RegisterParams {
  const _$RegisterParamsImpl(
      {this.username = "", this.role = "", this.password = ""});

  factory _$RegisterParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterParamsImplFromJson(json);

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'UserSignUpParams(username: $username, role: $role, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterParamsImpl &&
            (identical(other.username, username) || other.username == username) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, role, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterParamsImplCopyWith<_$RegisterParamsImpl> get copyWith =>
      __$$RegisterParamsImplCopyWithImpl<_$RegisterParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterParamsImplToJson(
      this,
    );
  }
}

abstract class _RegisterParams implements UserSignUpParams {
  const factory _RegisterParams(
      {final String username,
      final String role,
      final String password}) = _$RegisterParamsImpl;

  factory _RegisterParams.fromJson(Map<String, dynamic> json) =
      _$RegisterParamsImpl.fromJson;

  @override
  String get username;
  @override
  String get role;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$RegisterParamsImplCopyWith<_$RegisterParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
