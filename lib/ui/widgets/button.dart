import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/widgets/loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickety_admission/values/colors.dart';

//* For the LEADING ICONS - ONLY ENTER THE NAME.EXT ("menu.svg")

class CustomButton extends StatelessWidget {
  final bool isDisabled;
  final bool isLoading;
  final String leadingIcon;
  final String trailingIcon;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color buttonShadowColor;
  final Color borderColor;
  final Color splashColor;
  final VoidCallback? handleOnClick;
  final double? fontSize;
  final double iconWidth;
  final double borderRadius;
  final double borderWidth;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? width;
  final double? height;
  final double marginX;
  final double marginY;
  final double elevation;
  final double paddingX;
  final double paddingY;

  const CustomButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = kPrimaryColor,
    this.borderColor = Colors.transparent,
    this.buttonShadowColor = Colors.transparent,
    this.splashColor = Colors.transparent,
    this.handleOnClick,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height = 60,
    this.iconWidth = 25,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.fontStyle = FontStyle.normal,
    this.borderRadius = 20,
    this.borderWidth = 2,
    this.marginX = 0,
    this.marginY = 10,
    this.paddingX = 0,
    this.paddingY = 0,
    this.elevation = 0.9,
    this.trailingIcon = "",
    this.leadingIcon = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginY),
      constraints: const BoxConstraints(
        minWidth: 130,
        maxHeight: 60,
        maxWidth: 390,
        minHeight: 60,
      ),
      width: width,
      height: height,
      child: Material(
        elevation: elevation,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: () {
            if (isDisabled) {
              return;
            } else {
              return handleOnClick!();
            }
          },
          splashColor: isDisabled ? neutralColor400 : splashColor,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: isLoading && isDisabled
                  ? backgroundColor
                  : isDisabled
                      ? neutralColor400
                      : backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: isDisabled ? Colors.transparent : borderColor,
                width: isDisabled ? 0 : borderWidth,
              ),
              boxShadow: isDisabled
                  ? null
                  : [
                      BoxShadow(
                        color: buttonShadowColor,
                        blurRadius: 12,
                        offset: const Offset(-8, 10),
                        spreadRadius: 0,
                      ),
                    ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // * LEADING ICON
                  leadingIcon != ""
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/$leadingIcon",
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                              width: iconWidth,
                            ),
                            const SizedBox(width: 10),
                          ],
                        )
                      : const SizedBox.shrink(),

                  // * BUTTON CONTENT
                  Center(
                    child: isLoading
                        ? LoadingState(
                            isWhite: backgroundColor == kPrimaryColor,
                          )
                        : Text(
                            text,
                            style: TextStyle(
                              color: isDisabled ? Colors.white : textColor,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                            ),
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
