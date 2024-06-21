import 'package:flutter/material.dart';
import 'package:tickety_admission/values/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionButton extends StatelessWidget {
  final String iconSrc;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;

  final VoidCallback? onTap;
  final String text;
  final double? fontSize, borderRadius, elevation, height, width;
  final Color? color,
      endColor,
      beginColor,
      borderColor,
      backgroundColor,
      iconBackgroundColor,
      shadowColor,
      boxShadowColor,
      textColor;
  final bool linearGradient;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;

  const ActionButton({
    super.key,
    required this.text,
    this.iconColor,
    this.iconSrc = 'assets/icons/logo-app-icon.svg',
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
    this.onTap,
    this.fontSize,
    this.color,
    this.borderColor,
    this.borderRadius,
    this.textColor,
    this.linearGradient = false,
    this.height,
    this.boxDecoration,
    this.textStyle,
    this.width,
    this.elevation,
    this.endColor,
    this.beginColor,
    this.backgroundColor,
    this.shadowColor,
    this.boxShadowColor,
    this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      height: height ?? 90,
      decoration: boxDecoration ??
          BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: neutralColor800.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(-7, 9),
                  spreadRadius: 2,
                )
              ],
              gradient: linearGradient
                  ? LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        beginColor ?? const Color.fromARGB(255, 46, 71, 85),
                        endColor ?? const Color.fromARGB(255, 24, 77, 87)
                      ],
                    )
                  : null,
              color: color,
              borderRadius: BorderRadius.circular(borderRadius ?? 16)),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shadowColor:
              WidgetStateProperty.all(shadowColor ?? Colors.transparent),
          splashFactory: InkRipple.splashFactory,
          backgroundColor:
              WidgetStateProperty.all(backgroundColor ?? Colors.transparent),
          elevation: WidgetStateProperty.all<double>(elevation ?? 0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(
                borderRadius ?? 10,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: iconBackgroundColor ?? kPrimaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  iconSrc,
                  width: 48,
                  colorFilter: ColorFilter.mode(
                    iconColor ?? kPrimaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                text,
                style: textStyle ??
                    TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "League Spartan",
                      fontSize: 18,
                      color: textColor ?? kPrimaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
