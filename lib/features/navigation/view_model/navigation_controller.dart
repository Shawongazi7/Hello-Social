import 'package:get/get.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/features/home/explore/explore_screen.dart';
import 'package:meetmax/features/home/feed/feed/view/feed_screen.dart';
import 'package:meetmax/features/home/my_community/my_community_screen.dart';
import 'package:meetmax/features/home/notification/notification_screen.dart';
import 'package:meetmax/features/home/settings/view/settings_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class NavigationController extends GetxController {
  final RxInt currentIndex = 0.obs;
  late final PersistentTabController persistentController;

  @override
  void onInit() {
    super.onInit();
    persistentController = PersistentTabController(initialIndex: 0);
  }

  @override
  void onClose() {
    persistentController.dispose();
    super.onClose();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    persistentController.index = index;
  }

  List<Widget> get screens => [
        FeedScreen(),
        const MyCommunityScreen(),
        const ExploreScreen(),
        const NotificationScreen(),
        SettingsScreen(),
      ];

  List<PersistentBottomNavBarItem> get navBarItems => [
        buildNavBarItem(
          icon: ImageAssets.feedIcon,
          title: AppStrings.feed,
        ),
        buildNavBarItem(
          icon: ImageAssets.communityIcon,
          title: AppStrings.myCommunity,
        ),
        buildNavBarItem(
          icon: ImageAssets.exploreIcon,
          title: AppStrings.explore,
        ),
        buildNavBarItem(
          icon: ImageAssets.notificationIcon,
          title: AppStrings.notification,
          badge: '3',
        ),
        buildNavBarItem(
          icon: ImageAssets.settingsIcon,
          title: AppStrings.settings,
        ),
      ];

  PersistentBottomNavBarItem buildNavBarItem({
    required String icon,
    required String title,
    String? badge, // Optional badge parameter
  }) {
    return PersistentBottomNavBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: badges.Badge(
          showBadge: badge != null,
          badgeContent: Text(
            badge ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(4),
          ),
          position: badges.BadgePosition.topEnd(top: -8, end: -4),
          child: Image.asset(
            icon,
            height: 16,
            width: 16,
          ),
        ),
      ),
      title: title,
      textStyle: AppFonts.bodyRegular.copyWith(
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 10,
      ),
      activeColorPrimary: AppColors.textColor,
      inactiveColorPrimary: AppColors.textColor,
    );
  }
}
