


import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? hintText;
  final String? label;
  final String? errorMessage;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final bool obscureText;

  const CustomTextFormField({super.key, 
    this.hintText, 
    this.label, 
    this.errorMessage, 
    this.onChanged, 
    this.validator,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20)
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label != null ? Text(label!) : null ,
        hintText: hintText,
        errorText: errorMessage,
        suffixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary,)
      ),
    );
  }
}