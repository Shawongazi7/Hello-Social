import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/authentication/widgets/custom_button.dart';
import 'package:meetmax/features/home/feed/widgets/icon_text_row.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/routes/routes_name.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/utils/loading_customization.dart';

class CreatePostSection extends StatelessWidget {
  const CreatePostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesName.createPostScreen);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fwww.gravatar.com%2Favatar%2F2c7d99fe281ecd3bcd65ab915bac6dd5%3Fs%3D250',
                      // Replace with your image URL
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => loadingWidget(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      height: 35,
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What\'s happening?',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconTextRow(
                      iconPath: ImageAssets.videoIcon,
                      label: AppStrings.video,
                    ),
                    const SizedBox(width: 20),
                    IconTextRow(
                      iconPath: ImageAssets.imageIcon,
                      label: AppStrings.image,
                    ),
                    const SizedBox(width: 20),
                    IconTextRow(
                      iconPath: ImageAssets.nameIcon,
                      label: AppStrings.feeling,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomButton(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 58,
                        height: 30,
                        text: 'Post',
                        textStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                        ),
                        backgroundColor: AppColors.blue,
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
