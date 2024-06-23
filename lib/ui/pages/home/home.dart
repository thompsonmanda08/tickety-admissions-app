// ignore_for_file: library_private_types_in_public_api

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/pages/home/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/action_button.dart';
import 'package:tickety_admission/ui/widgets/avatar.dart';
import 'package:tickety_admission/ui/widgets/container_card.dart';
import 'package:tickety_admission/ui/widgets/settings_icon.dart';
import 'package:tickety_admission/ui/widgets/search.dart';
import 'package:tickety_admission/values/colors.dart';

class HomeIndex extends GetView<HomeController> {
  final void Function(int) navigateTo;
  const HomeIndex({
    super.key,
    required this.navigateTo,
  });

  static const List<Map<String, dynamic>> actions = [
    {
      "title": "Scan Qr Code",
      "icon": "assets/icons/scanIcon.svg",
      "page": "/manual-admission",
    },
    {
      "title": "Scan Qr Code",
      "icon": "assets/icons/scanIcon.svg",
      "page": "/manual-admission",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        leading: const Avatar(firstName: "FirstName", lastName: "lastName"),
        // title: "Ticket Admin",
        titleWidget: Expanded(
          child: Search(
            onSearch: (String str) => {},
          ),
        ),
        trailing: SettingsIcon(
          onTap: () => Get.toNamed("/events"),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 60,
          ),
          child: Container(
            color: neutralColor300,
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              children: [
                const SizedBox(height: 24),
                const ContainerCard(
                  imageSrc: "assets/images/events.jpg",
                  height: 150,
                  child: Column(
                    children: [
                      Text("EVENT IMG"),
                    ],
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
                ActionButton(
                  iconSrc: "assets/icons/saleIcon.svg",
                  iconColor: kPrimaryColor,
                  iconBackgroundColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  borderRadius: 20,
                  text: "Ticket Sale",
                  onTap: () => Get.toNamed("/ticket-sale"),
                ),
                const SizedBox(height: 16), //
                ActionButton(
                  iconSrc: "assets/icons/reportsIcon.svg",
                  iconColor: kPrimaryColor,
                  iconBackgroundColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  borderRadius: 20,
                  text: "Reports & Stats",
                  onTap: () => Get.toNamed("/reports"),
                ),
                const SizedBox(height: 16), //
                ActionButton(
                  iconSrc: "assets/icons/reportsIcon.svg",
                  iconColor: kPrimaryColor,
                  iconBackgroundColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  borderRadius: 20,
                  text: "Status",
                  onTap: () => Get.toNamed("/status"),
                ), //
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
