// ignore_for_file: must_be_immutable

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tickety_admission/values/colors.dart';

class CustomDropDownField extends StatelessWidget {
  CustomDropDownField({
    super.key,
    this.id = "drop_down",
    required this.dropDownItems,
    required this.selectedItem,
    this.onChanged,
    this.height = 60,
    this.width,
  });

  final String? id;
  final List<String> dropDownItems;
  final ValueChanged<String?>? onChanged;
  final double? height;
  final double? width;
  String selectedItem;

  @override
  Widget build(BuildContext context) {
    var isExpanded = false.obs;

    return Stack(
      children: [
        Container(
          height: height,
          width: width ?? double.maxFinite,
          decoration: BoxDecoration(
            color: primaryColor50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(
                () => InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    isExpanded.value = !isExpanded.value;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          selectedItem,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: neutralColor400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          isExpanded.value
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: neutralColor400,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // EXPANDABLE CONTAINER
        Obx(
          () => isExpanded.value
              ? Transform.translate(
                  offset: const Offset(0, -8),
                  child: Container(
                    margin: EdgeInsets.only(top: height ?? 50),
                    constraints: const BoxConstraints(maxWidth: 390),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(isExpanded.value ? 10 : 0),
                        bottomRight: Radius.circular(isExpanded.value ? 10 : 0),
                      ),
                    ),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      // physics: const NeverScrollableScrollPhysics(),

                      children: dropDownItems
                          .map(
                            (dropdownItem) => InkWell(
                              onTap: () {
                                isExpanded.value = false;
                                selectedItem = dropdownItem;
                                onChanged!(dropdownItem);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: selectedItem == dropdownItem
                                      ? primaryColor100
                                      : kPrimaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    dropdownItem.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
