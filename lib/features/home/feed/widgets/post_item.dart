import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:meetmax/features/home/feed/feed/model/post_model.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:meetmax/features/home/feed/widgets/icon_text_row.dart';
import 'package:meetmax/features/home/feed/widgets/video_player.dart';
import 'package:meetmax/utils/app_utils.dart';
import 'package:meetmax/res/assets/image_assets.dart';

class PostItemWidget extends StatelessWidget {
  final Post post;

  const PostItemWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: post.postOwner?.profilePicture ??
                          'https://randomuser.me/api/portraits/men/1.jpg',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.postOwner?.firstName ?? "Unknown User",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            timeago.format(DateTime.parse(
                                post.createdAt ?? DateTime.now().toString())),
                            style:
                                TextStyle(color: AppColors.grey, fontSize: 12),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            post.isPublic ?? false ? '• Public' : '• Private',
                            style:
                                TextStyle(color: AppColors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, color: AppColors.grey),
                onPressed: () =>
                    AppUtils.instance.showInfoToast('More options'),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Post Content
          Text(
            post.content ?? '',
            style: TextStyle(color: AppColors.textColor, fontSize: 14),
          ),
          const SizedBox(height: 10),

          // Post Image or Video
          if (post.image != null || post.video != null)
            post.image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: post.image!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayerWidget(url: post.video!),
                  ),
          const SizedBox(height: 10),

          // Reactions and Comments Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  for (int i = 0;
                      i <
                          (post.reactionCount != 0 && post.reactionCount! > 3
                              ? 3
                              : post.reactionCount!);
                      i++)
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: const CachedNetworkImageProvider(
                        'https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fwww.gravatar.com%2Favatar%2F2c7d99fe281ecd3bcd65ab915bac6dd5%3Fs%3D250',
                      ),
                    ),
                  if (post.reactionCount != 0 && post.reactionCount! > 3)
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.blueGrey[700],
                      child: Text(
                        '+${post.reactionCount! - 3}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  Text('${post.commentCount} Comments',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(width: 10),
                  Text('${post.shareCount} Shares',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          Divider(color: AppColors.grey.withOpacity(0.5)),

          // Action Buttons (Like, Comment, Share)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconTextRow(
                  iconPath: ImageAssets.likeIcon, label: 'Like', onTap: () {}),
              IconTextRow(
                  iconPath: ImageAssets.commentIcon,
                  label: 'Comment',
                  onTap: () {}),
              IconTextRow(
                  iconPath: ImageAssets.shareIcon,
                  label: 'Share',
                  onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
