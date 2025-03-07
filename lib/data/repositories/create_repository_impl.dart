
import 'package:dartz/dartz.dart';

import 'package:farm_form/domain/use_case/crop_upload_use_case.dart';

import '../../domain/repository/crop_upload_repository.dart';
import '../../domain/use_case/farm_type_upload_use_case.dart';
import '../../utils/App.dart';
import '../remote/create_remote_data_source.dart';

class CreateRepositoryImpl extends CreateRepository {



  @override
  Future<Either> createCrop(CreateCropReq createCropReq) async {
    return sl<CreateRemoteDatasource>().createCrop(createCropReq);
  }

  @override
  Future<Either> createFarmType(CreateFarmTypeReq createFarmTypeReq) async {
    return sl<CreateRemoteDatasource>().createFarmType(createFarmTypeReq);

  }
}