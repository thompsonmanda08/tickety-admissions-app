import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/reports/controller.dart';
import 'package:tickety_admission/ui/pages/reports/widgets/stats.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/main_header.dart';
import 'package:tickety_admission/ui/widgets/tab.dart';
import 'package:tickety_admission/values/colors.dart';

class ReportsPage extends GetView<ReportsController> {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: screenSize.height * 0.9),
              child: Column(
                children: [
                  const MainHeader(
                    // removeLogo: true,
                    title: 'Reports & Statistics',
                    subtitle:
                        'Keep track of Ticket sales and admissions on the platform',
                  ),
                  Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
