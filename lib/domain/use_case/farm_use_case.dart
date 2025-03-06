import 'package:dartz/dartz.dart';
import 'package:farm_form/core/hive/hive.dart';

import '../../core/common/usecase/use_case.dart';
import '../../utils/App.dart';
import '../repository/farm_repository.dart';

class FarmUseCase implements UseCase<Either,CreateFarmReq> {
  @override
  Future<Either> call({CreateFarmReq ? params}) async {


    return sl<FarmRepository>().createFarm(params!);
  }

}


class CreateFarmReq {
  final String farmerName;
  final String nationalId;
  final String location;
  final int farmType;
  final int crop;
  final int createdBy;

  CreateFarmReq({
    required this.farmerName,
    required this.nationalId,
    required this.location,
    required this.farmType,
    required this.crop,
    required this.createdBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'farmer_name': farmerName,
      'national_id': nationalId,
      'location': location,
      'farm_type': farmType,
      'crop': crop,
      'created_by': createdBy,
    };
  }

  factory CreateFarmReq.fromMap(Map<String, dynamic> map) {
    return CreateFarmReq(
      farmerName: map['farmer_name'] ?? '',
      nationalId: map['national_id'] ?? '',
      location: map['location'] ?? '',
      farmType: map['farm_type'] ?? 0,
      crop: map['crop'] ?? 0,
      createdBy: map['created_by'] ?? 0,
    );
  }
}
