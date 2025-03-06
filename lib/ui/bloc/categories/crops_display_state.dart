import 'package:farm_form/domain/entities/category.dart';

abstract class CropsDisplayState {}

class CropsLoading extends CropsDisplayState {}

class CropsLoaded extends CropsDisplayState {
  final List<CropEntity> Crops;
  CropsLoaded({required this.Crops});
}

class LoadCropsFailure extends CropsDisplayState {}