import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosp_app/data/app_data.dart';
import 'package:hosp_app/presentation/screens/login_screen.dart';
import 'package:hosp_app/presentation/theme/app_colors.dart';
import 'package:hosp_app/presentation/theme/app_fonts.dart';
import 'package:hosp_app/presentation/widgets/custom_button.dart';
import 'package:hosp_app/presentation/widgets/settings_button.dart';
import 'package:hosp_app/presentation/widgets/welcome_row.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          'Профиль',
          style: AppFonts.w600s17,
        ),
        centerTitle: true,
        actions: [
          SettingsButton(
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Зачем нужен профиль?', style: AppFonts.w500s22),
            SizedBox(
              height: 25.h,
            ),
            Column(
              children: AppData.data
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: WelcomeInfoRow(image: e.image, title: e.title),
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              title: 'Войти',
            )
          ],
        ),
      ),
    );
  }
}
