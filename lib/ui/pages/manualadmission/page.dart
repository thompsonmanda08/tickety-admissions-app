import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/manualadmission/controller.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';
import 'package:tickety_admission/values/colors.dart';

class ManualAdmissionPage extends GetView<ManualAdmissionController> {
  const ManualAdmissionPage({super.key});
  bool fieldsFilledAndValid() {
    if (controller.ticketNumber.value.isNotEmpty) {
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
                      'Manual Admission',
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
                      'Provide a ticket number to verify the ticket details',
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
                          'Ticket Number',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: neutralColor900,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextInputField(
                          textInputType: TextInputType.number,
                          inputFieldName: "ticket_number",
                          labelText: "Ticket Number",
                          handleOnChanged: (value) {
                            controller.ticketNumber.value = value;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Obx(() {
                          bool isValid = fieldsFilledAndValid();
                          return CustomButton(
                            isDisabled: isValid,
                            text: 'Validate',
                            isLoading: controller.isLoading.value,
                            handleOnClick: () {
                              Get.toNamed('/home');
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
