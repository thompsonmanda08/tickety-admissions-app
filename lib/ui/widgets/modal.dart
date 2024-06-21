import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/container_card.dart';
import 'package:tickety_admission/values/colors.dart';
import 'package:tickety_admission/ui/widgets/loader.dart';

showCustomModal(
  BuildContext context, {
  String? button1Text,
  String? button2Text,
  String? title,
  Widget? child,
  VoidCallback? handleButton1Click,
  VoidCallback? handleButton2Click,
  bool isDismissible = true,
  backgroundColor,
  bool isLoading = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: isDismissible,
    builder: (BuildContext context) {
      final Size screenSize = MediaQuery.of(context).size;

      return Dialog(
        backgroundColor: isLoading ? Colors.transparent : null,
        shadowColor: isLoading ? Colors.transparent : null,
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: isLoading
            ? const LoadingState(
                isWhite: true,
              )
            : ContainerCard(
                backgroundColor: Colors.white,
                boxConstraints: BoxConstraints(
                  maxHeight: screenSize.height * 0.75,
                  minHeight: 190,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title != null
                        ? Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: kPrimaryColor,
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 14),
                    child!,
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        if (button2Text != null)
                          Expanded(
                            child: CustomButton(
                              text: button2Text,
                              handleOnClick: () {
                                if (handleButton2Click != null) {
                                  Get.back();
                                  handleButton2Click();
                                } else {
                                  Get.back(result: false);
                                }
                              },
                            ),
                          ),
                        if (button2Text != null) const SizedBox(width: 10),
                        if (button1Text != null)
                          Expanded(
                            child: CustomButton(
                              text: button1Text,
                              handleOnClick: () {
                                if (handleButton1Click != null) {
                                  Get.back(result: true);
                                  handleButton1Click();
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
      );
    },
  );
}
