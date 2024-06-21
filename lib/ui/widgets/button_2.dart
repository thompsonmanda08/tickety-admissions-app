import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? fontSize, borderCircular, elevation, height, width;
  final Color? color,
      endColor,
      beginColor,
      borderColor,
      backgroundColor,
      shadowColor,
      boxShadowColor,
      fontColor;
  final FontWeight? fontWeight;
  final bool linearGradient;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final Widget? child;

  const Button({
    super.key,
    required this.text,
    this.onTap,
    this.child,
    this.fontSize,
    this.color,
    this.borderColor,
    this.fontWeight,
    this.borderCircular,
    this.fontColor,
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
  });

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
              borderRadius: BorderRadius.circular(borderCircular ?? 16)),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shadowColor:
              WidgetStateProperty.all(shadowColor ?? Colors.transparent),
          splashFactory: InkRipple.splashFactory,
          backgroundColor:
              WidgetStateProperty.all(backgroundColor ?? Colors.white),
          elevation: WidgetStateProperty.all<double>(elevation ?? 0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(
                borderCircular ?? 10,
              ),
            ),
          ),
        ),
        child: child ??
            Text(
              text,
              style: textStyle ??
                  TextStyle(
                    color: fontColor ?? Colors.white,
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w500,
                  ),
            ),
      ),
    );
  }
}
