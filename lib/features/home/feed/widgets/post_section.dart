import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/home/feed/feed/view_model/post_controller.dart';
import 'package:meetmax/features/home/feed/widgets/post_item.dart';
import 'package:meetmax/utils/loading_customization.dart';

class PostSection extends StatelessWidget {
  final PostController controller;

  const PostSection({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final postData = controller.postsList;

      if (postData.isEmpty) {
        return loadingWidget();
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: postData.length,
        itemBuilder: (context, index) {
          final post = postData[index];
          return PostItemWidget(post: post);
        },
      );
    });
  }
}
