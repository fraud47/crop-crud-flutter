import 'package:flutter/material.dart';
import '../../theme/app_pallete.dart';
import 'ToastsOverlayWidget.dart';

class ToastsService{
  static OverlayState? _overlayState;
  static void showSuccess(String message, BuildContext context){
    _show(message, AppPallete.blue,context);
  }
  static void showError(String message, BuildContext context){
    _show(message,AppPallete.errorColor,context);
  }

  static void _show(
      String message,
      Color backgroundColor,
      BuildContext context,
      ){
    _overlayState=Overlay.of(context);
    final overlayEntry =OverlayEntry(builder: (context)=>ToastsOverlayWidget(
      message: message,
      backgroundColor: backgroundColor,
    ));

    _overlayState!.insert(overlayEntry);
    Future.delayed(const Duration(
      seconds: 2))
    .then((value) => overlayEntry.remove());
  }
}