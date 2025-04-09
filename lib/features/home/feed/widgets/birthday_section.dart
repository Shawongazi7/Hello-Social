import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:meetmax/features/authentication/widgets/custom_text_field.dart';
import 'package:meetmax/features/home/feed/widgets/see_all.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/utils/app_utils.dart';
import 'package:meetmax/utils/loading_customization.dart';

class BirthdaySection extends StatelessWidget {
  const BirthdaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeeAll(
            title: AppStrings.birthdays,
            seeAll: AppStrings.seeAll,
          ),
          Divider(
            color: AppColors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              AppUtils.instance.showInfoToast('Profile feature upcoming soon');
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://randomuser.me/api/portraits/men/1.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => loadingWidget(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Doe',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          'Birthday Today',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: AppStrings.writeOnHisInbox,
                        textStyle: TextStyle(
                          color: AppColors.black87,
                          fontSize: 12,
                        ),
                        borderColor: AppColors.white,
                        backgroundColor: AppColors.grey.withOpacity(0.06),
                        height: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        AppUtils.instance
                            .showInfoToast('Message feature upcoming soon');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.blue.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(ImageAssets.sendIcon,
                            width: 15, height: 15),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              AppUtils.instance
                  .showInfoToast('Birthday feature is not implemented yet.');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.06),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.lightYellow.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.asset(
                            ImageAssets.giftIcon,
                            width: 15,
                            height: 15,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.upcomingBirthdays,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                AppStrings.seeOthersUpcomingBirthdays,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
