import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up.freezed.dart';

@freezed
class SignUp with _$SignUp {
  const factory SignUp({int? id,
  String? name ,
  String? email}) = _SignUp;
}