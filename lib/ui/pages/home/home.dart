// ignore_for_file: library_private_types_in_public_api

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/pages/home/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/action_button.dart';
import 'package:tickety_admission/ui/widgets/avatar.dart';
import 'package:tickety_admission/ui/widgets/container_card.dart';
import 'package:tickety_admission/ui/widgets/settings_icon.dart';
import 'package:tickety_admission/values/colors.dart';

class HomeIndex extends GetView<HomeController> {
  final void Function(int) navigateTo;
  const HomeIndex({
    super.key,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // ****************** SCREEN RENDERER ************************ /
    return Scaffold(
      appBar: CustomAppBar(
        leading: Avatar(
          firstName: controller.session.firstName,
          lastName: controller.session.lastName,
        ),
        titleWidget: Center(
          child: Container(
            // color: Colors.red,
            constraints: const BoxConstraints(maxHeight: 50),
            padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello,',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: neutralColor100,
                    height: 0,
                  ),
                ),
                Text(
                  "${controller.session.firstName} ${controller.session.lastName}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: neutralColor100,
                  ),
                ),
              ],
            ),
          ),
        ),
        trailing: SettingsIcon(
          icon: "changeIcon",
          onTap: () => Get.offAllNamed("/events"),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              color: neutralColor300,
              width: screenSize.width,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  ContainerCard(
                    imageSrc: "assets/images/events.jpg",
                    height: 150,
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black, // START
                            Colors.transparent, // END
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            controller.session.event["eventName"],
                            style: const TextStyle(
                              fontSize: 20,
                              color: neutralColor100,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ************* ACTION LIST ITEMS ****************//
                  ActionButton(
                    iconSrc: "assets/icons/scanIcon.svg",
                    iconColor: kPrimaryColor,
                    iconBackgroundColor: Colors.transparent,
                    backgroundColor: Colors.white,
                    borderRadius: 20,
                    text: "Scan QR code",
                    onTap: () => navigateTo(1),
                  ), // INDEX 1 ==> Scan Page
                  const SizedBox(height: 16),
                  ActionButton(
                    iconSrc: "assets/icons/manualAdmissionIcon.svg",
                    iconColor: kPrimaryColor,
                    iconBackgroundColor: Colors.transparent,
                    backgroundColor: Colors.white,
                    borderRadius: 20,
                    text: "Manual Admission",
                    onTap: () => Get.toNamed("manual-admission"),
                  ), //
                  const SizedBox(height: 16),
                  // ActionButton(
                  //   iconSrc: "assets/icons/saleIcon.svg",
                  //   iconColor: kPrimaryColor,
                  //   iconBackgroundColor: Colors.transparent,
                  //   backgroundColor: Colors.white,
                  //   borderRadius: 20,
                  //   text: "Ticket Sale",
                  //   onTap: () => Get.toNamed("/ticket-sale"),
                  // ),
                  // const SizedBox(height: 16), //
                  // ActionButton(
                  //   iconSrc: "assets/icons/reportsIcon.svg",
                  //   iconColor: kPrimaryColor,
                  //   iconBackgroundColor: Colors.transparent,
                  //   backgroundColor: Colors.white,
                  //   borderRadius: 20,
                  //   text: "Reports & Stats",
                  //   onTap: () => Get.toNamed("/reports"),
                  // ),
                  // const SizedBox(height: 16), //
                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
