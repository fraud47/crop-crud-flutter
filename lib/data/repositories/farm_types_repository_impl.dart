
import 'package:dartz/dartz.dart';
import 'package:farm_form/data/remote/response/farm_type_response.dart';

import '../../core/common/error/failures.dart';
import '../../domain/entities/farm_type.dart';
import '../../domain/repository/farm_types.dart';
import '../../utils/App.dart';
import '../remote/farm_types_remote_data_source.dart';

class FarmTypesRepositoryImpl extends FarmTypesRepository {


  @override
  Future<Either<Failure, List<FarmTypeEntity>>> getFarmTypes() async {
    final _farmtypes = await sl<FarmTypesRemoteDatasource>().getFarmTypes();
    return _farmtypes.fold(
            (failure)=>Left(failure),
            (data){

          return Right(
              data.toEntity()
          );
        }
    );
  }

}