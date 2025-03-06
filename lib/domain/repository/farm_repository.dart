import 'package:farm_form/domain/use_case/farm_use_case.dart';
import 'package:dartz/dartz.dart';


abstract class FarmRepository {


Future<Either> createFarm(CreateFarmReq createfarmReq);

}