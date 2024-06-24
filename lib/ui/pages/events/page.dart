import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/events/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/avatar.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/main_header.dart';
import 'package:tickety_admission/ui/widgets/searchableDropdown.dart';
import 'package:tickety_admission/values/colors.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({super.key});
  bool fieldsFilledAndValid() {
    if (controller.selectedEventName.value.isNotEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: CustomAppBar(
            leading: Avatar(
              firstName: controller.session.firstName,
              lastName: controller.session.lastName,
            ),
            titleWidget: Center(
              child: Container(
                // color: Colors.red,
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
          ),
          body: RefreshIndicator(
            backgroundColor: kPrimaryColor.withOpacity(0),
            color: Colors.white,
            displacement: 20,
            edgeOffset: 10,
            onRefresh: () async {
              await controller.getEvents();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                color: Colors.white,
                constraints: BoxConstraints(minHeight: screenSize.height * 0.9),
                child: Column(
                  children: [
                    const MainHeader(
                      title: "Manage Event",
                      subtitle:
                          "Choose an event to manage, you can change events at any time",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select an event',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: kPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SearchableDropdownMenu(
                            hintText: "Select event",
                            isDynamicSearch: true,
                            displayKey: "eventName",
                            searchableItems: controller.events
                                .map((event) => event)
                                .toList(),
                            handleSelectItem: (value) {
                              final selectedValue = value.item;
                              controller.selectedEventName.value =
                                  selectedValue['eventName'];
                              controller.event.value = selectedValue;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          Obx(
                            () {
                              bool isValid = fieldsFilledAndValid();
                              return CustomButton(
                                isDisabled: isValid,
                                text: 'Continue',
                                isLoading: controller.isLoading.value,
                                handleOnClick:
                                    controller.handleChangeSessionEvent,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
