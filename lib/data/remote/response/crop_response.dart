import '../../../domain/entities/category.dart';

class CropResponse {
  bool? _successful;
  String? _narration;
  int? _status;
  List<Body>? _body;

  CropResponse({
    bool? successful,
    String? narration,
    int? status,
    List<Body>? body,
  }) {
    _successful = successful;
    _narration = narration;
    _status = status;
    _body = body;
  }

  // Getters
  bool? get successful => _successful;
  String? get narration => _narration;
  int? get status => _status;
  List<Body>? get body => _body;

  // Setters
  set successful(bool? value) => _successful = value;
  set narration(String? value) => _narration = value;
  set status(int? value) => _status = value;
  set body(List<Body>? value) => _body = value;

  CropResponse.fromJson(Map<String, dynamic> json) {
    _successful = json['successful'];
    _narration = json['narration'];
    _status = json['status'];
    if (json['body'] != null) {
      _body = <Body>[];
      json['body'].forEach((v) {
        _body!.add(Body.fromJson(v));
      });
    }
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['successful'] = _successful;
    data['narration'] = _narration;
    data['status'] = _status;
    if (_body != null) {
      data['body'] = _body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  int? _id;
  String? _name;

  Body({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  // Getters
  int? get id => _id;
  String? get name => _name;

  // Setters
  set id(int? value) => _id = value;
  set name(String? value) => _name = value;

  Body.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }

}

extension CropResponseMapper on CropResponse {
  List<CropEntity> toEntity() {


    return body?.map((body) => CropEntity(name: body.name ?? "", id: body.id?.toString() ?? "")).toList() ?? [];

  }
}