import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/home/feed/feed/view_model/dependency/post_binding.dart';
import 'package:meetmax/features/home/profile/view_model/user_profile_controller.dart';
import 'package:meetmax/features/navigation/view/navigation.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthToken(); // Check the token when the screen initializes
  }

  // Function to check if the auth token exists
  Future<void> _checkAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken'); // Get the token

    // Navigate based on whether the token exists or not
    Timer(
      const Duration(seconds: 3),
      () => authToken != null && authToken.isNotEmpty
          ? (
              Get.put(UserProfileController()),
              Get.offAll(() => const Navigation(), binding: PostBinding())
            )
          : Get.offAllNamed(RoutesName.signInScreen), // Go to sign-in screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: WidgetAnimator(
          outgoingEffect: WidgetTransitionEffects.outgoingSlideOutToTop(),
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(),
          atRestEffect: WidgetRestingEffects.bounce(),
          child: Image.asset(
            ImageAssets.meetmaxLogoWithName,
            width: 228,
            height: 140,
          ),
        ),
      ),
    );
  }
}
