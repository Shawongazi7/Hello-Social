import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetmax/features/authentication/widgets/custom_button.dart';
import 'package:meetmax/features/home/feed/create_post/view_model/create_post_controller.dart';
import 'package:meetmax/features/home/feed/widgets/icon_text_row.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/utils/app_utils.dart';
import 'package:meetmax/utils/loading_customization.dart';

class CreatePost extends StatelessWidget {
  CreatePost({super.key});

  final CreatePostController createPostController = Get.find<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        maxLines: 5,
                        controller: createPostController.contentController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What\'s happening?',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Obx(() {
                      //   // Check if there is a picked image or video
                      //   if (createPostController.pickedImage.value != null || createPostController.pickedVideo.value != null) {
                      //     return Column(
                      //       children: [
                      //         // If there is a picked image, display it
                      //         if (createPostController.pickedImage.value != null)
                      //           Padding(
                      //             padding: const EdgeInsets.only(right: 10, bottom: 10),
                      //             child: Stack(
                      //               children: [
                      //                 ClipRRect(
                      //                   borderRadius: BorderRadius.circular(8.0),
                      //                   child: Image.file(
                      //                     File(createPostController.pickedImage.value!.path),
                      //                     height: 150,
                      //                     width: double.infinity,
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 ),
                      //                 Positioned(
                      //                   top: -10,
                      //                   right: -10,
                      //                   child: IconButton(
                      //                     icon: Icon(
                      //                       Icons.cancel_outlined,
                      //                       color: AppColors.black54,
                      //                       size: 20,
                      //                     ),
                      //                     onPressed: () {
                      //                       createPostController.removePickedImage();
                      //                     },
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         // If there is a picked video, display it
                      //         if (createPostController.pickedVideo.value != null)
                      //           Padding(
                      //             padding: const EdgeInsets.only(right: 10, bottom: 10),
                      //             child: Stack(
                      //               children: [
                      //                 ClipRRect(
                      //                   borderRadius: BorderRadius.circular(8.0),
                      //                   child: Container(
                      //                     height: 150,
                      //                     width: double.infinity,
                      //                     color: Colors.black,
                      //                     alignment: Alignment.center,
                      //                     child: Icon(
                      //                       Icons.videocam,
                      //                       color: Colors.white,
                      //                       size: 50,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Positioned(
                      //                   top: -10,
                      //                   right: -10,
                      //                   child: IconButton(
                      //                     icon: Icon(
                      //                       Icons.cancel_outlined,
                      //                       color: AppColors.black54,
                      //                       size: 20,
                      //                     ),
                      //                     onPressed: () {
                      //                       createPostController.removePickedVideo();
                      //                     },
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //       ],
                      //     );
                      //   } else {
                      //     return const SizedBox.shrink(); // If no media is selected, return an empty space
                      //   }
                      // }),

                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              IconTextRow(
                iconPath: ImageAssets.videoIcon,
                label: AppStrings.liveVideo,
                // onTap: () => createPostController.pickVideo(),
                onTap: () {
                  AppUtils.instance.showInfoToast('Live video feature upcoming soon');
                },
              ),
              const SizedBox(height: 10),
              IconTextRow(
                iconPath: ImageAssets.imageIcon,
                label: AppStrings.photoOrVideo,
                // onTap: () => createPostController.pickImage(),
                onTap: () {
                  AppUtils.instance.showInfoToast('Photo or video feature upcoming soon');
                },
              ),
              const SizedBox(height: 10),
              IconTextRow(
                iconPath: ImageAssets.nameIcon,
                label: AppStrings.feeling,
                onTap: () {
                  AppUtils.instance.showInfoToast('Feeling feature upcoming soon');
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 30,
                text: 'Post',
                textStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                ),
                backgroundColor: AppColors.blue,
                onPressed: () {
                  createPostController.onPressedCreatePost();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
