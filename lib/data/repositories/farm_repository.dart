import 'package:dartz/dartz.dart';
import 'package:farm_form/data/remote/farm_remote_data_source.dart';
import 'package:farm_form/domain/repository/farm_repository.dart';
import 'package:farm_form/domain/use_case/farm_use_case.dart';

import '../../utils/App.dart';

class FarmRepositoryImpl extends FarmRepository {


  @override
  Future<Either> createFarm(CreateFarmReq createfarmReq) async {
    return sl<FarmRemoteDatasource>().createFarm(createfarmReq);
  }
}