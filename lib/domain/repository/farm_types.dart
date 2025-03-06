import 'package:dartz/dartz.dart';

abstract class FarmTypesRepository {

  Future<Either> getFarmTypes();
}