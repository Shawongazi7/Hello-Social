import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:meetmax/features/home/feed/widgets/event_section.dart';
import 'package:meetmax/features/home/feed/widgets/see_all.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/utils/app_utils.dart';

class RecentEventsSection extends StatelessWidget {
  const RecentEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 320,
      child: Column(
        children: [
          SeeAll(
            title: AppStrings.recentEvents,
            seeAll: AppStrings.seeAll,
          ),
          Divider(
            color: AppColors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 10),
          EventSection(
            eventIcon: ImageAssets.bookIcon,
            eventIconContainerColor: AppColors.lightGreen.withOpacity(0.2),
            eventName: AppStrings.eventNameOne,
            eventDetails: AppStrings.eventNameDetailsOne,
            seenUserProfiles: List.generate(
              10,
              (index) =>
                  'https://randomuser.me/api/portraits/${index % 2 == 0 ? 'men' : 'women'}/${index + 1}.jpg',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          EventSection(
            eventIcon: ImageAssets.cameraIcon,
            eventIconContainerColor: AppColors.lightOrange.withOpacity(0.2),
            eventName: AppStrings.eventNameTwo,
            eventDetails: AppStrings.eventNameDetailsTwo,
            seenUserProfiles: List.generate(
              5,
              (index) =>
                  'https://randomuser.me/api/portraits/${index % 2 == 0 ? 'men' : 'women'}/${index + 1}.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
