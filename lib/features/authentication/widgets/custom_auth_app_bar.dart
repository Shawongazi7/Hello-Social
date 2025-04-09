import 'package:flutter/material.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/features/authentication/widgets/language_dropdown_button.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white.withOpacity(0.99),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(ImageAssets.meetmaxLogoWithName),
                width: 80,
                height: 50,
              ),
              LanguageDropdownButton(),
            ],
          ),
        ],
      ),
    );
  }
}
