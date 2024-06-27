import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/widgets/loader.dart';
import 'package:tickety_admission/values/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.onTap,
    this.child,
    this.fontSize,
    this.color,
    this.borderColor,
    this.fontWeight,
    this.borderRadius,
    this.fontColor,
    this.linearGradient = false,
    this.isDisabled = false,
    this.isLoading = false,
    this.height,
    this.boxDecoration,
    this.textStyle,
    this.width,
    this.elevation,
    this.endColor,
    this.beginColor,
    this.backgroundColor = kPrimaryColor,
    this.shadowColor,
    this.boxShadowColor,
  });

  final VoidCallback? onTap;
  final String text;
  final double? fontSize, borderRadius, elevation, height, width;
  final Color? color,
      endColor,
      beginColor,
      borderColor,
      backgroundColor,
      shadowColor,
      boxShadowColor,
      fontColor;
  final FontWeight? fontWeight;
  final bool linearGradient, isDisabled, isLoading;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      height: height ?? 54,
      decoration: boxDecoration ??
          BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: boxShadowColor ?? Colors.transparent,
                  offset: const Offset(0, 4),
                  blurRadius: 5.0)
            ],
            gradient: linearGradient
                ? LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      beginColor ?? const Color(0xff427ECF),
                      endColor ?? const Color(0xff2D5994)
                    ],
                  )
                : null,
            color: color,
            borderRadius: BorderRadius.circular(borderRadius ?? 14),
          ),
      child: ElevatedButton(
        onPressed: isDisabled ? () => {} : onTap,
        style: ButtonStyle(
          shadowColor:
              WidgetStateProperty.all(shadowColor ?? Colors.transparent),
          splashFactory: InkRipple.splashFactory,
          backgroundColor: WidgetStateProperty.all(
              isDisabled ? neutralColor400 : backgroundColor ?? Colors.white),
          elevation: WidgetStateProperty.all<double>(elevation ?? 0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(
                borderRadius ?? 14,
              ),
            ),
          ),
        ),
        child: child ??
            Center(
              child: isLoading
                  ? LoadingState(
                      isWhite: backgroundColor == kPrimaryColor,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        color: isDisabled
                            ? Colors.white
                            : fontColor ?? Colors.white,
                        fontSize: fontSize ?? 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
        // Text(
        //   text,
        //   style: textStyle ??
        //       TextStyle(
        //         color: fontColor ?? Colors.white,
        //         fontSize: fontSize ?? 16,
        //         fontWeight: fontWeight ?? FontWeight.w500,
        //       ),
        // ),
      ),
    );
  }
}
