import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosp_app/presentation/screens/activation_screen.dart';
import 'package:hosp_app/presentation/screens/create_profile_screen.dart';
import 'package:hosp_app/presentation/screens/home_screen.dart';
import 'package:hosp_app/presentation/screens/welcome_screen.dart';
import 'package:hosp_app/presentation/theme/app_colors.dart';
import 'package:hosp_app/presentation/widgets/text_field_unfocused.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => TextFieldUnfocus(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.white,
              elevation: 1),
            fontFamily: 'sf_pro'
          ),
          home:   HomeScreen(),
        ),
      )
    );
  }
}
