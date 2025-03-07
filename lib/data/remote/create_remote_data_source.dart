import 'package:dartz/dartz.dart';
import 'package:farm_form/data/remote/response/create_crop_response.dart';
import 'package:farm_form/data/remote/response/create_res_farm_type_response.dart';

import '../../core/api/dio_client.dart';
import '../../core/api/list_api.dart';
import '../../core/common/error/failures.dart';
import '../../domain/use_case/crop_upload_use_case.dart';
import '../../domain/use_case/farm_type_upload_use_case.dart';

abstract class CreateRemoteDatasource {


  Future<Either<Failure, CreateCropResponse>> createCrop(CreateCropReq req);
  Future<Either<Failure, CreateFarmTypeResponse>> createFarmType(CreateFarmTypeReq req);
}

class CreateRemoteDatasourceImpl implements CreateRemoteDatasource {
  final DioClient _client;

  CreateRemoteDatasourceImpl(this._client);


  @override
  Future<Either<Failure, CreateCropResponse>> createCrop(CreateCropReq req) async {
    final response = await _client.postRequest(
      ListAPI.crops,
      data: req.toMap(),
      converter: (response) =>
          CreateCropResponse.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }
  @override
  Future<Either<Failure, CreateFarmTypeResponse>> createFarmType(CreateFarmTypeReq req) async {
    final response = await _client.postRequest(
      ListAPI.farmtype,
      data: req.toMap(),
      converter: (response) =>
          CreateFarmTypeResponse.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }
}
