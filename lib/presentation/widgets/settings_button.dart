import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosp_app/presentation/theme/app_colors.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.onPressed
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.settings_outlined,
          size: 24.h,
          color: AppColors.black.withOpacity(0.75),
        ));
  }
}