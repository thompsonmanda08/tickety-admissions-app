import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/events/controller.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/searchableDropdown.dart';
import 'package:tickety_admission/values/colors.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({super.key});
  bool fieldsFilledAndValid() {
    if (controller.event.value.isNotEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/icons/background.svg',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                      kPrimaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/logo.svg',
                        width: 150,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 90,
                    left: 0,
                    right: 0,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Event Management',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        color: neutralColor100,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 130,
                    left: 0,
                    right: 0,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Choose an event to manage, you  can change \n events at any time',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: neutralColor100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 250.0),
                        const Text(
                          'Select Event',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: kPrimaryColor,
                          ),
                        ),
                        const Text(
                          'Select the event  for this session',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: neutralColor900,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SearchableDropdownMenu(
                          hintText: "Select event",
                          searchableItems: events
                              .map((element) => element["name"].toString())
                              .toList(),
                          handleSelectItem: (value) {
                            final selectedValue = value.item as String;
                            controller.event.value = selectedValue;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Obx(() {
                          bool isValid = fieldsFilledAndValid();
                          return CustomButton(
                            isDisabled: isValid,
                            text: 'Continue',
                            isLoading: controller.isLoading.value,
                            handleOnClick: () {
                              Get.toNamed('/manual-admission');
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> events = [
  {"name": "Trade Exchange"},
  {"name": "Trade Fair"},
  {"name": "Dance Experience"},
  {"name": "Tech 1 Expo"},
  {"name": "Tech 2 Expo"},
  {"name": "Tech 3 Expo"},
  {"name": "Tech 4 Expo"},
  {"name": "Tech 5 Expo"},
];
