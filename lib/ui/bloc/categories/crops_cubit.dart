import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/crops_use_case.dart';
import '../../../utils/App.dart';
import 'crops_display_state.dart';

class CropsDisplayCubit extends Cubit<CropsDisplayState> {

  CropsDisplayCubit() : super (CropsLoading());

  void displayCrops() async {
    var returnedData = await sl<GetCropsUseCase>().call();
    returnedData.fold(
            (error){
          emit(
              LoadCropsFailure()
          );
        },
            (data) {
          emit(
              CropsLoaded(Crops: data)
          );
        }
    );
  }

}