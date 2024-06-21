import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/home/binding.dart';
import 'package:tickety_admission/ui/pages/home/page.dart';
import 'package:tickety_admission/ui/pages/login/binding.dart';
import 'package:tickety_admission/ui/pages/login/page.dart';
import 'package:tickety_admission/ui/pages/onboarding/binding.dart';
import 'package:tickety_admission/ui/pages/onboarding/page.dart';
import 'package:tickety_admission/ui/pages/pay/binding.dart';
import 'package:tickety_admission/ui/pages/pay/page.dart';
import 'package:tickety_admission/ui/pages/settings/binding.dart';
import 'package:tickety_admission/ui/pages/settings/page.dart';
import 'package:tickety_admission/ui/pages/splash/binding.dart';
import 'package:tickety_admission/ui/pages/splash/page.dart';
import 'package:tickety_admission/ui/pages/status/page.dart';
import 'package:tickety_admission/values/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tickety Admission',
      theme: ThemeData(
        primarySwatch: ticketyColors,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: ticketyColors),
        scaffoldBackgroundColor: const Color(0XFFFCFCFC),
        fontFamily: "League Spartan",
      ),
      initialRoute: '/',
      getPages: [
        // * SPLASH - ON APP OPEN
        GetPage(
          name: '/',
          transition: Transition.noTransition,
          binding: SplashPageBinding(),
          page: () {
            return const SplashPage();
          },
        ),

        GetPage(
          name: '/onboarding',
          transition: Transition.rightToLeftWithFade,
          binding: OnBoardingPageBinding(),
          page: () {
            return const OnBoardingPage();
          },
        ),
        GetPage(
          name: '/home',
          transition: Transition.rightToLeftWithFade,
          binding: HomeBinding(),
          page: () {
            return HomePage();
          },
        ),
        GetPage(
          name: '/settings',
          transition: Transition.rightToLeftWithFade,
          binding: SettingsPageBinding(),
          page: () {
            return const SettingsPage();
          },
        ),
        GetPage(
          name: '/pay',
          transition: Transition.rightToLeftWithFade,
          binding: PayBinding(),
          page: () {
            return PayPage();
          },
        ),
        GetPage(
          name: '/status',
          transition: Transition.rightToLeftWithFade,
          // binding: OnBoardingPageBinding(),
          page: () {
            return const StatusPage();
          },
        ),
        GetPage(
          name: '/login',
          transition: Transition.rightToLeftWithFade,
          binding: LoginBinding(),
          page: () {
            return const LoginPage();
          },
        ),
      ],
    );
  }
}
