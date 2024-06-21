import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
    this.isWhite = false,
    this.width,
    this.height,
  });

  final bool isWhite;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final lottieFile = isWhite ? "loader_white.json" : "loader_blue.json";
    return Lottie.asset(
      "assets/lottie/$lottieFile",
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
