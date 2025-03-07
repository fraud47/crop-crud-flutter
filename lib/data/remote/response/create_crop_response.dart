class CreateCropResponse {
  bool? successful;
  String? narration;
  int? status;
  Body? body;

  CreateCropResponse({this.successful, this.narration, this.status, this.body});

  CreateCropResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;

  Body({this.id, this.name});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
