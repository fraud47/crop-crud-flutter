import 'package:dartz/dartz.dart';

import '../../core/common/usecase/use_case.dart';
import '../../utils/App.dart';
import '../repository/crop_upload_repository.dart';

class FarmTypeUseCase implements UseCase<Either,CreateFarmTypeReq> {
  @override
  Future<Either> call({CreateFarmTypeReq ? params}) async {


    return sl<CreateRepository>().createFarmType(params!);
  }

}


class CreateFarmTypeReq {
  final String name;


  CreateFarmTypeReq({
    required this.name,

  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory CreateFarmTypeReq.fromMap(Map<String, dynamic> map) {
    return CreateFarmTypeReq(
      name: map['name'] ?? '',

    );
  }
}
