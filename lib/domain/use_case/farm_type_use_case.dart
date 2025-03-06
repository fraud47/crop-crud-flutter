import 'package:dartz/dartz.dart';

import '../../core/common/usecase/use_case.dart';
import '../../utils/App.dart';
import '../repository/farm_types.dart';

class GetFarmTypesUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<FarmTypesRepository>().getFarmTypes();
  }

}