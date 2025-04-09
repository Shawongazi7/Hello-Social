import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/home/feed/feed/view_model/post_controller.dart';
import 'package:meetmax/features/home/feed/widgets/birthday_section.dart';
import 'package:meetmax/features/home/feed/widgets/custom_feed_app_bar.dart';
import 'package:meetmax/features/home/feed/widgets/create_post_section.dart';
import 'package:meetmax/features/home/feed/widgets/post_section.dart';
import 'package:meetmax/features/home/feed/widgets/recent_events_section.dart';
import 'package:meetmax/features/home/feed/widgets/stories_section.dart';
import 'package:meetmax/features/home/profile/view_model/user_profile_controller.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/widgets/section_divider.dart';

class FeedScreen extends GetView<PostController> {
  FeedScreen({super.key});

  final UserProfileController userProfileController =
      Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.99),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.blue,
          backgroundColor: Colors.white,
          onRefresh: () async {
            await controller.fetchPosts();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                CustomFeedAppBar(
                  controller: userProfileController,
                ),
                const SectionDivider(),
                StoriesSection(),
                const SectionDivider(),
                const CreatePostSection(),
                const SectionDivider(),
                PostSection(
                  controller: controller,
                ),
                const SectionDivider(),
                const RecentEventsSection(),
                const SectionDivider(),
                const BirthdaySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
