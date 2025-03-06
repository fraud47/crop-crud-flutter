import 'package:dartz/dartz.dart';

import '../../core/common/usecase/use_case.dart';
import '../../utils/App.dart';
import '../repository/crops.dart';

class GetCropsUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CropsRepository>().getCrops();
  }

}