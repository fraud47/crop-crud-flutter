
import 'package:farm_form/ui/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/common/auth/bloc/logout/logout_bloc.dart';
import '../../../core/common/auth/bloc/logout/logout_state.dart';
import '../../../utils/App.dart';
import '../main_screen.dart';


class MainScreenWrapper extends StatelessWidget {

  static route() => MaterialPageRoute(
    builder: (context) => MainScreenWrapper(),
  );
  const MainScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LogoutBloc>(),
      child: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>SignIn()),
                  (route) => false, // Remove all previous routes
            );
          }
        },
        child: MainScreen(),
      ),
    );
  }
}

