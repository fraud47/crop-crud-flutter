

import 'package:farm_form/data/remote/crops_remote_data_source.dart';
import 'package:farm_form/domain/use_case/farm_type_use_case.dart';
import 'package:get_it/get_it.dart';

import '../core/api/dio_client.dart';
import '../core/common/auth/bloc/logout/logout_bloc.dart';
import '../core/hive/hive.dart';
import '../data/remote/auth_remote_data_source.dart';
import '../data/remote/farm_types_remote_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/crops_repository_impl.dart';
import '../data/repositories/farm_types_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/repository/crops.dart';
import '../domain/repository/farm_types.dart';
import '../domain/use_case/crops_use_case.dart';
import '../domain/use_case/user_login.dart';
import '../domain/use_case/user_sign_up.dart';
import '../ui/bloc/sign_in/sign_in_bloc.dart';
import '../ui/bloc/sign_up/sign_up_bloc.dart';



GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String prefixBox = '',
}) async {
  /// For unit testing only
  if (isUnitTest) {
    await sl.reset();
  }
  sl.registerSingleton<DioClient>(DioClient(isUnitTest: isUnitTest));
  _dataSources();
  _repositories();
  _useCase();
  _bloc();
  if (isHiveEnable) {
    await _initHiveBoxes(
      isUnitTest: isUnitTest,
      prefixBox: prefixBox,
    );
  }
}

Future<void> _initHiveBoxes({
  bool isUnitTest = false,
  String prefixBox = '',
}) async {
  await MainBoxMixin.initHive(prefixBox);
  sl.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<CropsRepository>(
        () => CropsRepositoryImpl(),
  );
  sl.registerLazySingleton<FarmTypesRepository>(
        () => FarmTypesRepositoryImpl(),
  );
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(sl()),
  );


  sl.registerLazySingleton<CropsRemoteDatasource>(
      ()=> CropsRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<FarmTypesRemoteDatasource>(
        ()=>FarmTypesRemoteDatasourceImpl(sl()),
  );
}



void _useCase() {
  /// Auth
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));

  /// admin
  sl.registerSingleton<GetCropsUseCase>(
      GetCropsUseCase()
  );
  sl.registerSingleton<GetFarmTypesUseCase>(
      GetFarmTypesUseCase()
  );


}

void _bloc() {
  /// Auth
  sl.registerFactory(() => SignUpBloc(sl()));
  sl.registerFactory(() => SignInBloc(sl()));
  sl.registerFactory(() => LogoutBloc(sl()));

  /// Users
  // sl.registerFactory(() => UsersCubit(sl()));
  // sl.registerFactory(() => SettingsCubit());
  // sl.registerFactory(() => MainCubit());
}