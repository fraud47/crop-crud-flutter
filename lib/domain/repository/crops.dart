import 'package:dartz/dartz.dart';

abstract class CropsRepository {

  Future<Either> getCrops();
}