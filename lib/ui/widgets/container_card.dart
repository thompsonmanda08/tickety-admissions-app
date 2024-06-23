import 'package:flutter/material.dart';
import 'package:tickety_admission/values/colors.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.child,
    this.imageSrc,
    this.borderRadius = 15,
    this.shadowOpacity = 0.05,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.boxConstraints,
    this.onPress,
  });

  final double? height;
  final double? width;
  final double borderRadius;
  final double shadowOpacity;
  final Widget? child;
  final Color? backgroundColor;
  final String? imageSrc;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? boxConstraints;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // * CARD CONTAINER
        constraints: boxConstraints,
        width: width ?? double.maxFinite,
        height: height,
        padding: padding,
        margin: margin,
        decoration: ShapeDecoration(
          image: imageSrc != null
              ? DecorationImage(
                  image: AssetImage(imageSrc as String), fit: BoxFit.cover)
              : null,
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          shadows: [
            BoxShadow(
              color: neutralColor800.withOpacity(shadowOpacity),
              blurRadius: 10,
              offset: const Offset(-7, 9),
              spreadRadius: 2,
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
