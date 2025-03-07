import 'package:dartz/dartz.dart';

import '../../core/common/usecase/use_case.dart';
import '../../utils/App.dart';
import '../repository/crop_upload_repository.dart';

class CropUseCase implements UseCase<Either,CreateCropReq> {
  @override
  Future<Either> call({CreateCropReq ? params}) async {


    return sl<CreateRepository>().createCrop(params!);
  }

}


class CreateCropReq {
  final String name;


  CreateCropReq({
    required this.name,

  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory CreateCropReq.fromMap(Map<String, dynamic> map) {
    return CreateCropReq(
      name: map['name'] ?? '',

    );
  }
}
