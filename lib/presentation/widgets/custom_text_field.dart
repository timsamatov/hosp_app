import 'package:flutter/material.dart';
import 'package:hosp_app/presentation/theme/app_colors.dart';
import 'package:hosp_app/presentation/theme/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      maxLength: 9,
      style: AppFonts.w700s17,
      controller: controller,
      decoration: const InputDecoration(
        counterText: '',
        prefix: Text(
          '0  ',
          style: AppFonts.w700s17,
        ),
        hintText: '_ _ _ _ _ _ _ _ _',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.fontsColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}