import 'package:dartz/dartz.dart';
import 'package:farm_form/data/remote/response/crop_response.dart';
import '../../core/api/dio_client.dart';
import '../../core/api/list_api.dart';
import '../../core/common/error/failures.dart';

abstract class CropsRemoteDatasource {
  Future<Either<Failure, CropResponse>> getCrops();

}

class CropsRemoteDatasourceImpl implements CropsRemoteDatasource {
  final DioClient _client;

  CropsRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, CropResponse>> getCrops() async {

      final response = await _client.getRequest(
        ListAPI.crops,

        converter: (response) =>
            CropResponse.fromJson(response),
      );

    return response;
    }



}