import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/avatar.dart';
import 'package:tickety_admission/ui/widgets/back_button.dart';
import 'package:tickety_admission/ui/widgets/button_2.dart';
import 'package:tickety_admission/ui/widgets/settings_icon.dart';
import 'package:tickety_admission/values/colors.dart';

class NoTicketDataFound extends StatelessWidget {
  const NoTicketDataFound({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CustomAppBar(
        leading: CustomBackButton(
          onBackClick: () => Get.offNamed("/home"),
        ),
        trailing: GestureDetector(
          onTap: () => Get.offAllNamed("/events"),
          child: const Text(
            "Change Event",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: neutralColor100,
              height: 2,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: screenSize.width * 0.50,
                      child: SvgPicture.asset(
                        'assets/icons/logo.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Button(
                    text: "Re-Scan",
                    height: 60,
                    backgroundColor: Colors.white,
                    fontColor: kPrimaryColor,
                    onTap: () => Get.back(),
                  ),
                  const SizedBox(height: 25),
                  Button(
                    text: "Manual Admission",
                    backgroundColor: kPrimaryColor,
                    height: 60,
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    fontColor: Colors.white,
                    onTap: () => Get.offNamed("/manual-admission"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
