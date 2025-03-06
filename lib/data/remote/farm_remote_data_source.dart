import 'package:dartz/dartz.dart';
import 'package:farm_form/data/models/farm_response.dart';
import 'package:farm_form/domain/use_case/farm_use_case.dart';

import '../../core/api/dio_client.dart';
import '../../core/api/list_api.dart';
import '../../core/common/error/failures.dart';

abstract class FarmRemoteDatasource {


  Future<Either<Failure, FarmResponse>> createFarm(CreateFarmReq req);
}

class FarmRemoteDatasourceImpl implements FarmRemoteDatasource {
  final DioClient _client;

  FarmRemoteDatasourceImpl(this._client);


  @override
  Future<Either<Failure, FarmResponse>> createFarm(CreateFarmReq req) async {
    print("farmer create");
    final response = await _client.postRequest(
      ListAPI.farmers,
      data: req.toMap(),
      converter: (response) =>
          FarmResponse.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }
}
