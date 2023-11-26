import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosp_app/presentation/theme/app_colors.dart';
import 'package:hosp_app/presentation/theme/app_fonts.dart';
import 'package:hosp_app/presentation/theme/app_pngs.dart';
import 'package:hosp_app/presentation/widgets/settings_button.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 4,
  );
  List<Widget> screens = [
    const Scaffold(
      body: Center(
        child: Text(
          'Доктора',
          style: AppFonts.w700s34,
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          'Cтатьи',
          style: AppFonts.w700s34,
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          'Вызов',
          style: AppFonts.w700s34,
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          'Мои доктора',
          style: AppFonts.w700s34,
        ),
      ),
    ),
    Scaffold(
      appBar: AppBar(
        actions: [
          SettingsButton(
            onPressed: () {},
          ),
        ],
        centerTitle: false,
        title: Text(
          'Мой профиль',
          style: AppFonts.w700s34.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.lightBlue,
                child: Text(
                  getInitials('Timurlan Samatov'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Timurlan Samatov',
                style: AppFonts.w500s22,),
              const SizedBox(
                height: 10,
              ),
               const Text('+996 999 818 027',
                style: AppFonts.w400s17,),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,

      controller: _controller,
      screens: screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style16, // Choose the nav bar style with this property.
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: const Icon(
          CupertinoIcons.person_crop_circle_fill_badge_plus,
        ),
        title: ("Доктора"),
        activeColorPrimary: AppColors.btnColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: const Icon(
          CupertinoIcons.square_favorites,
        ),
        title: ("Статьи"),
        activeColorPrimary: AppColors.btnColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(AppPngs.speech
          ),
        ),
        title: (" "),
        activeColorPrimary: AppColors.btnColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: const Icon(
          CupertinoIcons.flag,
        ),
        title: ("Мои доктора"),
        activeColorPrimary: AppColors.btnColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Профиль"),
        activeColorPrimary: AppColors.btnColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

String getInitials(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String initials = '';

    if (nameParts.length > 0) {
      for (int i = 0; i < nameParts.length; i++) {
        if (nameParts[i].isNotEmpty) {
          initials += nameParts[i][0];
        }
      }
    }

    return initials;
  }
