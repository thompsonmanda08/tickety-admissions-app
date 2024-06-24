import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/pages/transactions/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/drop_down_field.dart';
import 'package:tickety_admission/ui/widgets/profile_card.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';
import 'package:tickety_admission/values/colors.dart';

// ignore: must_be_immutable
class ProfilePage extends GetView<ProfileController> {
  final UserSessionService session = Get.find<UserSessionService>();
  final TransactionsController transactionsController =
      Get.put(TransactionsController());
  ProfilePage({super.key});

  void signUserOut() {
    session.stopUserSession();
    Get.offAllNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileCard(
                        name: 'Raphael',
                        phone: '0976566990',
                        firstName: 'Raphael',
                        lastName: 'Mbewe',
                        transactions:
                            transactionsController.filteredTransactions.length,
                        points: 0,
                        rank: 0,
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: neutralColor900,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextInputField(
                        textInputType: TextInputType.text,
                        inputFieldName: "full_name",
                        labelText: "Full Name",
                        initialValue: 'Raphael Mbewe',
                        handleOnChanged: (String value) {
                          // ignore: avoid_print
                          print("ID Number: $value");
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextInputField(
                        textInputType: TextInputType.number,
                        maxLength: 13,
                        inputFieldName: "mobile_number",
                        labelText: "Mobile Number",
                        initialValue: '0965294989',
                        handleOnChanged: (String value) {
                          // ignore: avoid_print
                          print("ID Number: $value");
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CustomDropDownField(
                        id: "payment_provider",
                        dropDownItems: telcos
                            .map((element) => element["name"].toString())
                            .toList(),
                        onChanged: (value) {
                          value!;
                        },
                        selectedItem: "Payment Provider",
                      ),
                      const SizedBox(height: 20.0),
                      CustomButton(
                        text: 'Update Profile',
                        handleOnClick: () {},
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: GestureDetector(
                          onTap: () => signUserOut(),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kPrimaryColor,
                            ),
                          ),
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
    );
  }

  List<Map<String, String>> telcos = [
    {"name": "ZamtelPay"},
    {"name": "MTN MOMO"},
    {"name": "AIRTEL MONEY"},
  ];
}
