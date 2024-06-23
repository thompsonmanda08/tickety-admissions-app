import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickety_admission/ui/widgets/logo.dart';
import 'package:tickety_admission/values/colors.dart';

class MainHeader extends StatelessWidget {
  const MainHeader(
      {super.key,
      required this.title,
      required this.subtitle,
      this.removeLogo = false});

  final String title;
  final String subtitle;
  final bool removeLogo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/icons/background.svg',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(
            kPrimaryColor,
            BlendMode.srcIn,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: !removeLogo ? 12 : 4),
                !removeLogo ? const Logo() : const SizedBox.shrink(),
                const SizedBox(height: 24),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    color: neutralColor100,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: neutralColor100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
