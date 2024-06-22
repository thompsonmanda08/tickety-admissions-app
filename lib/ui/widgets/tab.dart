import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/values/colors.dart';

class CustomTab extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> tabContent;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;

  CustomTab({
    super.key,
    required this.tabTitles,
    required this.tabContent,
    this.buttonPadding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.buttonMargin = const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
  });

  final RxInt _currentIndex = 0.obs;

  void _setSelectedIndex(int index) {
    _currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(11),
          height: 70,
          decoration: ShapeDecoration(
            color: kPrimaryColor.withOpacity(0.04),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: kPrimaryColor.withOpacity(0.04),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              tabTitles.length,
              (index) => _buildTabButton(index),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(() => tabContent[_currentIndex.value]),
        ),
      ],
    );
  }

  Widget _buildTabButton(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _setSelectedIndex(index);
        },
        child: Obx(
          () => Container(
            padding: buttonPadding,
            margin: buttonMargin,
            height: 60,
            decoration: ShapeDecoration(
              // ignore: unrelated_type_equality_checks
              color: _currentIndex == index ? Colors.white : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                tabTitles[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  fontWeight:
                      // ignore: unrelated_type_equality_checks
                      _currentIndex == index
                          ? FontWeight.w700
                          : FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
