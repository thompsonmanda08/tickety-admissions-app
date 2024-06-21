import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/pay/controller.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/content_display.dart';
import 'package:tickety_admission/ui/widgets/modal.dart';
import 'package:tickety_admission/ui/widgets/qr_details.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';
import 'package:tickety_admission/values/colors.dart';

// ignore: must_be_immutable
class PayPage extends GetView<PayController> {
  PayPage({super.key});
  final ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    controller.phone.value =
        profileController.profileDetails['profile']['phone'];
    controller.merchantNumber.value = data['merchantNumber'];
    controller.sender.value = profileController.profileDetails['profile']['id'];
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
                        QRDetails(
                          merchantName: data['businessName'],
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () => Get.toNamed('/home'),
                          child: const Text(
                            'Rescan QR Code',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: kPrimaryColor,
                              decorationThickness: 2.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Payment Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: neutralColor900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextInputField(
                          textInputType: TextInputType.number,
                          maxLength: 13,
                          inputFieldName: "amount",
                          labelText: "Enter Amount",
                          handleOnChanged: (String value) {
                            controller.amount.value = value;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            showCustomModal(
                              context,
                              title: 'Merchant Details',
                              button2Text: "Close",
                              child: Column(
                                children: [
                                  ContentDisplay(
                                    color: neutralColor500,
                                    firstText: 'MerchantID',
                                    secondText:
                                        '${data['businessName']}@${data['merchantNumber']}',
                                    firstTextColor: neutralColor400,
                                    secondTextColor: neutralColor200,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  ContentDisplay(
                                    color: neutralColor500,
                                    firstText: 'WalletNo',
                                    secondText: data['disbursementPhone'],
                                    firstTextColor: neutralColor400,
                                    secondTextColor: neutralColor200,
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const ContentDisplay(
                            color: primaryColor50,
                            firstText: 'Show Merchant Details',
                            firstTextColor: kPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Obx(
                          () => CustomButton(
                            isDisabled: controller.amount.value.isEmpty,
                            text: 'Pay',
                            isLoading: controller.isLoading.value,
                            handleOnClick: () {
                              controller.handlePayment();
                            },
                          ),
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
