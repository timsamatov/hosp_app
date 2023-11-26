import 'package:flutter/material.dart';
import 'package:hosp_app/core/app_consts.dart';
import 'package:hosp_app/presentation/screens/home_screen.dart';
import 'package:hosp_app/presentation/theme/app_fonts.dart';
import 'package:hosp_app/presentation/widgets/create_order_text_field.dart';
import 'package:hosp_app/presentation/widgets/custom_button.dart';
import 'package:hosp_app/presentation/widgets/shared_prefs_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerSureName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Создание профиля',
          style: AppFonts.w600s17,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            CreateOrderScreensTextField(
              controller: controllerName,
              hintText: 'Введите ваше имя',
              title: 'Имя',
            ),
            const SizedBox(
              height: 32,
            ),
            CreateOrderScreensTextField(
              controller: controllerSureName,
              hintText: 'Введите вашу фамилию',
              title: 'Фамилия',
            ),
            const Spacer(),
            CustomButton(
              onPressed: () async {
                final SharedPreferences prefs = SharedPrefsWidget.prefs;
                await prefs.setString(AppConsts.name, controllerName.text);
                await prefs.setString(
                    AppConsts.sureName, controllerSureName.text);
                await prefs.setBool(AppConsts.isLogined, true);

                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              title: 'Далее',
            ),
          ],
        ),
      ),
    );
  }
}