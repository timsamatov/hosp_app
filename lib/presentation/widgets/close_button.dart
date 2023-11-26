import 'package:flutter/material.dart';
import 'package:hosp_app/presentation/theme/app_colors.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
    required this.onPressed
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon:  Icon(
        Icons.close,
        color: AppColors.black.withOpacity(0.75),),);
  }
}