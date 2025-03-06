


import 'package:farm_form/ui/bloc/button/button_state_cubit.dart';
import 'package:farm_form/ui/bloc/sign_in/sign_in_bloc.dart';
import 'package:farm_form/ui/bloc/sign_up/sign_up_bloc.dart';
import 'package:farm_form/ui/pages/form.dart';
import 'package:farm_form/ui/pages/main_screen.dart';
import 'package:farm_form/ui/pages/main_screen/main_scren_wrapper.dart';
import 'package:farm_form/ui/pages/sign_in.dart';
import 'package:farm_form/utils/App.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/foundation.dart';

import 'core/common/auth/bloc/token_bloc.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'package:path_provider/path_provider.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );



  /// Register Service locator
  await serviceLocator();
  runApp(

    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SignUpBloc>()),
        BlocProvider(create: (_) => sl<SignInBloc>()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => TokenBloc()..add(CheckLoginStatus())),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeMode>(
        builder: (context,mode) => MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: mode,
      home: BlocBuilder<TokenBloc, TokenState>(
          builder: (context, state) {
            if (state is TokenLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TokenSuccess) {
              return const MainScreenWrapper();
            } else if (state is TokenFailure) {
              return SignIn();
            } else {
              return Text('failed');
            }
          },
      ))
    );
  }
}

