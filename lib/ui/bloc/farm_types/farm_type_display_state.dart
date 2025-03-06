import 'package:farm_form/domain/entities/category.dart';
import 'package:farm_form/domain/entities/farm_type.dart';

abstract class FarmTypeDisplayState {}

class FarmTypeLoading extends FarmTypeDisplayState {}

class FarmTypeLoaded extends FarmTypeDisplayState {
  final List<FarmTypeEntity> FarmType;
 FarmTypeLoaded({required this.FarmType});
}

class LoadCropsFailure extends FarmTypeDisplayState {}