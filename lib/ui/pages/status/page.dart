import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/values/colors.dart';

// ignore: must_be_immutable
class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                const CustomAppBar(),
                const SizedBox(height: 10.0),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 20.0),
                            Lottie.asset(
                              'assets/lottie/warning.json',
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'Confirm Transaction',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: neutralColor900,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'check your phone for a PIN prompt to complete the transaction',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: neutralColor200,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        CustomButton(
                          text: 'Done',
                          handleOnClick: () => Get.toNamed('/home'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
