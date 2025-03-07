import 'package:dartz/dartz.dart';

import '../use_case/crop_upload_use_case.dart';
import '../use_case/farm_type_upload_use_case.dart';


abstract class CreateRepository {


Future<Either> createCrop(CreateCropReq createCropReq);
Future<Either> createFarmType(CreateFarmTypeReq createFarmTypeReq);

}