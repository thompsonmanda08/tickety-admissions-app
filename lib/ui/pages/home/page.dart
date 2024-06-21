import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/home/controller.dart';
import 'package:tickety_admission/ui/pages/home/home.dart';
import 'package:tickety_admission/ui/pages/profile/page.dart';
import 'package:tickety_admission/ui/pages/scan/page.dart';
import 'package:tickety_admission/values/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  Widget build(BuildContext context) {
    void navigateTo(int page) {
      _controller.jumpTo(page);
      _pageController.jumpToPage(page);
    }

    final List<Widget> bottomBarPages = [
      HomeIndex(
        navigateTo: navigateTo,
      ),
      const Scan(),
      ProfilePage(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      // resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: kPrimaryColor,
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              kBottomRadius: 20,
              showTopRadius: true,
              notchColor: kPrimaryColor,
              bottomBarWidth: double.maxFinite,
              showShadow: false,
              durationInMilliSeconds: 200,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/icons/homeIcon.svg',
                    colorFilter: const ColorFilter.mode(
                        neutralColor100, BlendMode.srcIn),
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/icons/homeIcon.svg',
                    colorFilter: const ColorFilter.mode(
                        neutralColor100, BlendMode.srcIn),
                  ),
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/icons/scanIcon.svg',
                    colorFilter: const ColorFilter.mode(
                        neutralColor100, BlendMode.srcIn),
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/icons/scanIcon.svg',
                    colorFilter: const ColorFilter.mode(
                        neutralColor100, BlendMode.srcIn),
                  ),
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/icons/profileIcon.svg',
                    colorFilter: const ColorFilter.mode(
                        neutralColor100, BlendMode.srcIn),
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/icons/profileIcon.svg',
                    colorFilter: const ColorFilter.mode(
                        neutralColor100, BlendMode.srcIn),
                  ),
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
