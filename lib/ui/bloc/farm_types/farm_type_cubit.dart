import 'package:farm_form/domain/use_case/farm_type_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/crops_use_case.dart';
import '../../../utils/App.dart';
import 'farm_type_display_state.dart';

class FarmTypeDisplayCubit extends Cubit<FarmTypeDisplayState> {

 FarmTypeDisplayCubit() : super (FarmTypeLoading());

  void displayFarmType() async {
    var returnedData = await sl<GetFarmTypesUseCase>().call();
    returnedData.fold(
            (error){
          emit(
              LoadCropsFailure()
          );
        },
            (data) {
          emit(
             FarmTypeLoaded(FarmType: data)
          );
        }
    );
  }

}