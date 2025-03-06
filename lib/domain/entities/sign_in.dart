import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';

@freezed
class SignIn with _$SignIn {
  const factory SignIn({
    String? name ,
    String? email}) = _SignIn;
}