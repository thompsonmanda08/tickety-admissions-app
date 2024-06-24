import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/widgets/back_button.dart';
import 'package:tickety_admission/values/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {

  const CustomAppBar({
    super.key,
    this.leading,
    this.titleWidget,
    this.title = '',
    this.titleColor,
    this.trailing,
    this.background,
    this.backIconColor,
    this.onBackClick,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Widget? titleWidget;
  final Color? background, titleColor, backIconColor;
  final void Function()? onBackClick;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: background ?? kPrimaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * LEFT-SIDE
          leading ??
              CustomBackButton(
                backIconColor: backIconColor,
                onBackClick: onBackClick,
              ),

          //  * CENTER
          Expanded(
            child: titleWidget ??
                Transform.translate(
                  offset: const Offset(10, 0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: titleColor ?? neutralColor100,
                    ),
                  ),
                ),
          ),

          // * RIGHT-SIDE
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite, //width
        90, //height
      );

  @override
  Widget get child => throw UnimplementedError();
}
