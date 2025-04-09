import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meetmax/res/assets/lottie_assets.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  final String pageName;

  const UnderDevelopmentScreen({
    super.key,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.99),
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
            Text(
              "$pageName page is under development",
              style: const TextStyle(
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
