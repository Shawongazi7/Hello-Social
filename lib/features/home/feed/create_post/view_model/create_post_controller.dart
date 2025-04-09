import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/home/feed/create_post/model/post_response.dart';
import 'package:meetmax/features/navigation/view/navigation.dart';
import 'package:meetmax/features/navigation/view_model/dependency/navigation_binding.dart';
import 'package:meetmax/res/urls/api_urls.dart';
import 'package:meetmax/services/api_service.dart';
import 'package:meetmax/services/loading_service.dart';
import 'package:meetmax/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePostController extends GetxController {
  final loading = Loading.instance();

  TextEditingController contentController = TextEditingController();

  // Method to create post
  Future<void> onPressedCreatePost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken'); // Get the token

    if (contentController.text.isEmpty) {
      AppUtils.instance.showErrorToast('Please enter some content to post.');
      return;
    }

    // Continue with post creation
    loading.show();

    // Prepare data for the API request
    final postData = {
      'content': contentController.text,
    };

    // Create FormData for the post content
    var formData = FormData({
      'content': contentController.text,
    });

    // Determine the correct URL for the post
    String postUrl = APIUrls.createImagePostUrl(); // Adjust URL as needed

    APIService.sendPostRequestWithFormData(
      url: postUrl,
      headers: {'Authorization': 'Bearer $authToken'},
      data: formData,
      onSuccess: (response) async {
        final model = PostResponse.fromJson(
            response.body); // Use PostResponse model to parse response
        print('Error: ${model.message}');
        if (model.success) {
          loading.hide();
          AppUtils.instance.showSuccessToast('Post created successfully!');
          Get.offAll(() => Navigation(), binding: NavigationBinding());
          clearControllers();
        } else {
          loading.hide();
          AppUtils.instance.showSuccessToast('Post created successfully!');
          // print('Error: ${model.message}');
          loading.showErrorDialog(
            title: 'Post created successfully!',
            message: model.message,
          );
          clearControllers();
        }
      },
      onFailed: (error) {
        loading.showErrorDialog(
          title: 'Post created successfully!',
          message: error.body.toString(),
        );
        clearControllers();
      },
    );
  }

  // Utility function to clear controllers
  void clearControllers() {
    contentController.clear();
  }
}
