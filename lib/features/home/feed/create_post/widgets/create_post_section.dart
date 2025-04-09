import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/authentication/widgets/custom_button.dart';
import 'package:meetmax/features/home/feed/create_post/widgets/create_post.dart';
import 'package:meetmax/features/home/feed/create_post/widgets/privacy_dropdown_button.dart';
import 'package:meetmax/features/home/feed/widgets/icon_text_row.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/utils/loading_customization.dart';

class CreatePostSection extends StatelessWidget {
  const CreatePostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.99),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Text(
                    "Create a post",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(AppStrings.visibleFor,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.normal,
                      )),
                  const SizedBox(width: 5),
                  PrivacyDropdownButton(),
                  const SizedBox(width: 20),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(),
          ),
          const SizedBox(height: 10),
          CreatePost(),
        ],
      ),
    );
  }
}
