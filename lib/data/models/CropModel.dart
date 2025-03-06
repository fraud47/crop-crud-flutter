import 'dart:convert';

class CropModel {
  final int id;
  final String name;

  CropModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CropModel.fromMap(Map<String, dynamic> map) {
    return CropModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CropModel.fromJson(String source) =>
      CropModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
