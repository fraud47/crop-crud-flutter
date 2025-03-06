class FarmResponse {
  int? id;
  String? farmerName;
  String? nationalId;
  String? location;
  int? farmType;
  int? crop;
  int? createdBy;

  FarmResponse(
      {this.id,
        this.farmerName,
        this.nationalId,
        this.location,
        this.farmType,
        this.crop,
        this.createdBy});

  FarmResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerName = json['farmer_name'];
    nationalId = json['national_id'];
    location = json['location'];
    farmType = json['farm_type'];
    crop = json['crop'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['farmer_name'] = this.farmerName;
    data['national_id'] = this.nationalId;
    data['location'] = this.location;
    data['farm_type'] = this.farmType;
    data['crop'] = this.crop;
    data['created_by'] = this.createdBy;
    return data;
  }
}
