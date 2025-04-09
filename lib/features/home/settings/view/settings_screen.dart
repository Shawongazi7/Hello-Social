import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meetmax/features/home/settings/view_model/settings_controller.dart';
import 'package:meetmax/res/assets/lottie_assets.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.99),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_sharp, color: Colors.black),
            onPressed: () {
              controller.onPressedLogout();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              LottieAssets.underDevelopment,
              height: 200,
              width: 200,
            ),
            const Text(
              "Settings page is under development",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
                fontFamily: AppFonts.robotoRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
