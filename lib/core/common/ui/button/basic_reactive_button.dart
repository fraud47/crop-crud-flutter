import 'package:farm_form/core/common/toast/ContextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ui/bloc/button/button_state.dart';
import '../../../../ui/bloc/button/button_state_cubit.dart';


class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  final Widget ? content;
  const BasicReactiveButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.content,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonFailureState) {
            context.notify("upload error",
              isError: true,

            );
          } else if (state is ButtonSuccessState) {

            context.notify('item uploaded');
          }},
          builder: (context, state) {
            if (state is ButtonLoadingState) {

              CircularProgressIndicator();
            }
            return _initial();}
    );
  }

  Widget _loading() {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: Container(
        height: height ?? 50,
        alignment: Alignment.center,
        child: const CircularProgressIndicator()
      )
    );
  }

  Widget _initial() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 56),
      ),
      child: content ?? Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400
        ),
      )
    );
  }
}
