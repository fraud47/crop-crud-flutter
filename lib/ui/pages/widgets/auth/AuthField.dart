import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';


class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final String? Function(String?)? validator;
  const AuthField({

    super.key,
    this.validator,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(



      style: const TextStyle(color: AppPallete.black),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: AppPallete.darkGrey,
              width: 1.5, // Adjust the thickness of the border if necessary
            ),
            borderRadius: BorderRadius.circular(15.0)

        ),
      ),
      validator: validator?? (value) {
        if (value!.isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
