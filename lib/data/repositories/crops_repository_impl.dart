
import 'package:dartz/dartz.dart';
import 'package:farm_form/data/remote/response/crop_response.dart';
import 'package:farm_form/domain/entities/category.dart';

import '../../core/common/error/failures.dart';
import '../../domain/repository/crops.dart';
import '../../utils/App.dart';
import '../remote/crops_remote_data_source.dart';

class CropsRepositoryImpl extends CropsRepository {


  @override
  Future<Either<Failure, List<CropEntity>>> getCrops() async {
    final crops = await sl<CropsRemoteDatasource>().getCrops();
    return crops.fold(
      (failure)=>Left(failure),
      (data){

        return Right(
          data.toEntity()
        );
      }
    );
  }

}