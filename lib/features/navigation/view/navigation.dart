import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/navigation/view_model/navigation_controller.dart';
import 'package:meetmax/res/widgets/section_divider.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Navigation extends GetView<NavigationController> {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PersistentTabView(
          context,
          controller: controller.persistentController,
          screens: controller.screens,
          items: controller.navBarItems,
          navBarHeight: 80.0,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.only(bottom: 10, top: 5),
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(16),
            colorBehindNavBar: Colors.white,
          ),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarStyle: NavBarStyle.style14,
        ),
        const Positioned(
            bottom: 80.0, left: 0, right: 0, child: SectionDivider()),
      ],
    );
  }
}
