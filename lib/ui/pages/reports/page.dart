import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/reports/controller.dart';
import 'package:tickety_admission/ui/pages/reports/widgets/stats.dart';
import 'package:tickety_admission/ui/widgets/tab.dart';
import 'package:tickety_admission/values/colors.dart';

class ReportsPage extends GetView<ReportsController> {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
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
                  Positioned(
                    top: 35,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/logo.svg',
                        width: 150,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 90,
                    left: 0,
                    right: 0,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Reports & Statistics',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        color: neutralColor100,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 130,
                    left: 0,
                    right: 0,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Keep track of Ticket sales and admissions on the platform',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: neutralColor100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 250.0),
                        CustomTab(
                          tabTitles: const ['My Stats', 'All Stats'],
                          tabContent: const [
                            Stats(),
                            Stats(),
                          ],
                        ),
                      ],
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
