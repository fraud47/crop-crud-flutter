import 'package:dartz/dartz.dart';
import 'package:farm_form/data/remote/response/farm_type_response.dart';
import '../../core/api/dio_client.dart';
import '../../core/api/list_api.dart';
import '../../core/common/error/failures.dart';

abstract class FarmTypesRemoteDatasource {
  Future<Either<Failure, FarmTypeResponse>> getFarmTypes();

}

class FarmTypesRemoteDatasourceImpl implements FarmTypesRemoteDatasource {
  final DioClient _client;

  FarmTypesRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, FarmTypeResponse>> getFarmTypes() async {

    final response = await _client.getRequest(
      ListAPI.farmtype,

      converter: (response) =>
          FarmTypeResponse.fromJson(response),
    );

    return response;
  }



}