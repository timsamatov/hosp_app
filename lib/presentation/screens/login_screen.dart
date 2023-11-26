import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosp_app/core/app_consts.dart';
import 'package:hosp_app/presentation/screens/activation_screen.dart';
import 'package:hosp_app/presentation/theme/app_fonts.dart';
import 'package:hosp_app/presentation/widgets/close_button.dart';
import 'package:hosp_app/presentation/widgets/custom_button.dart';
import 'package:hosp_app/presentation/widgets/custom_text_field.dart';
import 'package:hosp_app/presentation/widgets/shared_prefs_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomCloseButton(
          onPressed: () {},
        ),
        title: const Text(
          'Вход',
          style: AppFonts.w600s17,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Войти',
              style: AppFonts.w700s34,
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Номер телефона',
                    style: AppFonts.w400s15,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomTextField(
                    onChanged: (val) {
                  setState(() {});
                }, controller: controller,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text(
                    'На указанный вами номер придет однократное СМС-сообщение с кодом подтверждения.',
                    style: AppFonts.w400s15,
                  )
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
                onPressed: controller.text.length < 9
                    ? null
                    : () async {
                        int code = Random().nextInt(8999) + 1000;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              code.toString(),
                            ),
                          ),
                        );
                        await SharedPrefsWidget.prefs.setString(
                        AppConsts.phoneNumber,
                        controller.text,
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivationNumberScreen(code: code,
                          ),
                        ),
                      );
                      },
                title: 'Далее')
          ],
        ),
      ),
    );
  }
}
