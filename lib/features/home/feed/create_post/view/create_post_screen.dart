import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/home/feed/create_post/widgets/create_post_section.dart';
import 'package:meetmax/features/home/feed/widgets/custom_feed_app_bar.dart';
import 'package:meetmax/features/home/profile/view_model/user_profile_controller.dart';
import 'package:meetmax/res/widgets/section_divider.dart';

class CreatePostScreen extends GetView<UserProfileController> {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.99),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFeedAppBar(
                  controller: controller,
                ),
                const SectionDivider(),
                const CreatePostSection(),
              ],
            ),
          ),
        ));
  }
}
