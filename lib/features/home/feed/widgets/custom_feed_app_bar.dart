import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/authentication/widgets/custom_text_field.dart';
import 'package:meetmax/features/home/profile/view_model/user_profile_controller.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/utils/app_utils.dart';
import 'package:meetmax/utils/loading_customization.dart';

class CustomFeedAppBar extends StatelessWidget {
  final UserProfileController controller;

  const CustomFeedAppBar({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              AppUtils.instance.showInfoToast('Profile feature upcoming soon');
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Obx(() {
                  if (controller.user?.profilePicture != null &&
                      controller.user!.profilePicture!.isNotEmpty) {
                    return CachedNetworkImage(
                      imageUrl: controller.user!.profilePicture!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => loadingWidget(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  } else {
                    return const Icon(Icons.person);
                  }
                }),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CustomTextField(
              hintText: AppStrings.searchForSomething,
              textStyle: TextStyle(
                color: AppColors.black87,
                fontSize: 12,
              ),
              height: 35,
              borderColor: AppColors.grey,
              icon: Image.asset(
                ImageAssets.searchIcon,
                width: 15,
                height: 15,
                color: AppColors.black87,
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              AppUtils.instance.showInfoToast('Message feature upcoming soon');
            },
            child: Image.asset(
              ImageAssets.messageBoxIcon,
              width: 20,
              fit: BoxFit.contain,
              color: AppColors.black87,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
