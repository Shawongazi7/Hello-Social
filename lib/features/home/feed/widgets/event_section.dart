import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/utils/app_utils.dart';

class EventSection extends StatelessWidget {
  final Color eventIconContainerColor;
  final String eventIcon;
  final String eventName;
  final String eventDetails;
  final List<String> seenUserProfiles;

  const EventSection({
    super.key,
    required this.eventIconContainerColor,
    required this.eventIcon,
    required this.eventName,
    required this.eventDetails,
    required this.seenUserProfiles,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppUtils.instance
            .showInfoToast('Recent events feature is not implemented yet.');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.06),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: eventIconContainerColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      eventIcon,
                      width: 15,
                      height: 15,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          eventName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          eventDetails,
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
            Divider(
              height: 16,
              color: AppColors.grey.withOpacity(0.5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${seenUserProfiles.length} seen',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < seenUserProfiles.take(3).length; i++)
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.grey[300],
                        backgroundImage:
                            CachedNetworkImageProvider(seenUserProfiles[i]),
                      ),
                    if (seenUserProfiles.length > 3)
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.blueGrey[700],
                        child: Text(
                          '+${seenUserProfiles.length - 3}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
