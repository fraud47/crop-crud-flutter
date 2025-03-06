import '../../core/common/entities/token.dart';

class LoginResponse {
  bool? successful;
  String? narration;
  int? status;
  Body? body;

  LoginResponse({this.successful, this.narration, this.status, this.body});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    successful = json['successful'];
    narration = json['narration'];
    status = json['status'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['successful'] = this.successful;
    data['narration'] = this.narration;
    data['status'] = this.status;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  String? refresh;
  String? access;
  String? role;
  int? id;


  Body({this.refresh,
    this.id,
    this.role,
    this.access});

  Body.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    data['role'] = this.access;
    data['access'] = this.access;
    return data;
  }

}

extension LoginResponseMapper on LoginResponse {
  Token toEntity() {
    return Token(
      access: body?.access,
      refresh: body?.refresh,
    );
  }
}