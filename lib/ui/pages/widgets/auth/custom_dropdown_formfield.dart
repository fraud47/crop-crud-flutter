import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class CustomDropdownField<T> extends StatefulWidget {
  final String hintText;
  final List<T> options;
  final T? selectedValue;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final TextEditingController? controller;



  const CustomDropdownField({
    super.key,
    required this.hintText,
    required this.options,
    required this.onChanged,
    this.selectedValue,
    this.validator,
    this.controller,
  });

  @override
  _CustomDropdownFieldState<T> createState() => _CustomDropdownFieldState<T>();
}

class _CustomDropdownFieldState<T> extends State<CustomDropdownField<T>> {
  late TextEditingController _textController;



  @override
  void initState() {
    super.initState();
    _textController = widget.controller ?? TextEditingController();

  }



  @override
  void dispose() {
    if (widget.controller == null) {
      _textController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: widget.selectedValue,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallete.darkGrey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
      ),
      items: widget.options.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString(), style: Theme.of(context).textTheme.bodyLarge),
        );
      }).toList(),
      onChanged: (value) {
        widget.onChanged(value);

      },
      validator: widget.validator ??
              (value) {
            if (value == null) {
              return "${widget.hintText} is required!";
            }
            return null;
          },
    );
  }
}
