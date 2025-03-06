import 'package:flutter/material.dart';

import '../../core/theme/app_pallete.dart';



extension ContextExtensions on BuildContext {
  bool isMobile() {
    final shortestSide = MediaQuery.of(this).size.shortestSide;

    return shortestSide < 600;
  }

  dynamic back([dynamic result]) => Navigator.pop(this, result);

  Future<dynamic> goTo(String routeName, {Object? args}) =>
      Navigator.pushNamed(this, routeName, arguments: args);

  Future<dynamic> goToReplace(String routeName, {Object? args}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: args);

  Future<dynamic> goToClearStack(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
            (Route<dynamic> route) => false,
        arguments: args,
      );

  double widthInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.height * toDouble;
  }

  //Start Loading Dialog
  static late BuildContext ctx;

  Future<void> show() => showDialog(
    context: this,
    barrierDismissible: false,
    builder: (c) {
      ctx = c;

      return PopScope(
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppPallete.whiteColor,
                borderRadius: BorderRadius.circular(6),
              ),
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.all(20),
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      );
    },
  );

  void dismiss() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }
}