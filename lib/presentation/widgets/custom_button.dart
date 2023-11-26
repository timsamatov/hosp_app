import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosp_app/presentation/theme/app_colors.dart';
import 'package:hosp_app/presentation/theme/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title
  });

  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 54.h,
        width: 296.w,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.btnColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ),
            onPressed: onPressed,
            child:  Text(
              title,
              style: AppFonts.w600s18,
            )),
      ),
    );
  }
}