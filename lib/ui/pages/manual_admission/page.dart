import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/manual_admission/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/main_header.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';

class ManualAdmissionPage extends GetView<ManualAdmissionController> {
  const ManualAdmissionPage({super.key});
  bool fieldsFilledAndValid() {
    if (controller.ticketNumber.value.isEmpty) {
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
          appBar: const CustomAppBar(),
          body: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: screenSize.height * 0.9),
              child: Column(
                children: [
                  const MainHeader(
                    // removeLogo: true,
                    title: 'Manual Admission',
                    subtitle:
                        'Provide a ticket number to verify the ticket details',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Obx(() {
                      bool isValid = fieldsFilledAndValid();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextInputField(
                            textInputType: TextInputType.number,
                            inputFieldName: "ticket_number",
                            labelText: "Ticket Number",
                            handleOnChanged: (value) {
                              controller.ticketNumber.value = value;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          CustomButton(
                            isDisabled: controller.isLoading.value
                                ? controller.isLoading.value
                                : !isValid,
                            text: 'Validate',
                            isLoading: controller.isLoading.value,
                            handleOnClick: () =>
                                controller.validateTicketNumber(),
                          )
                        ],
                      );
                    }),
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
