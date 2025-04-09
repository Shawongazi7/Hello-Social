import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/home/feed/feed/model/post_model.dart';
import 'package:meetmax/features/home/feed/feed/model/post_model_response.dart';
import 'package:meetmax/res/urls/api_urls.dart';
import 'package:meetmax/services/api_service.dart';
import 'package:meetmax/services/loading_service.dart';
import 'package:meetmax/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostController extends GetxController {
  final loading = Loading.instance();
  final postData = Rx<PostData?>(null);
  final postsList = <Post>[].obs;
  final int limit = 100; // Fetch 100 posts at once, or modify as needed

  PostData? get post => postData.value;

  void setPostData(PostData? data, {bool isRefresh = false}) {
    postData.value = data;

    if (data?.posts != null) {
      if (isRefresh) {
        postsList.clear(); // Clear previous posts when refreshing
      }
      postsList.addAll(data!.posts!); // Add the new posts
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts(); // Fetch all posts on init
  }

  Future<void> fetchPosts({bool isRefresh = false}) async {
    loading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    if (token != null) {
      try {
        final response = await APIService.sendGetRequest(
          url: APIUrls.postsGetUrl(page: 1, limit: limit),
          // Fetch all posts at once
          headers: {'Authorization': 'Bearer $token'},
        );

        final model = PostModelResponse.fromMap(response.body);
        if (model.data != null) {
          setPostData(model.data, isRefresh: isRefresh);
          AppUtils.instance.showInfoToast('Posts loaded successfully.');
        } else {
          AppUtils.instance.showErrorToast('Failed to load posts.');
        }
      } catch (e) {
        AppUtils.instance.showErrorToast('Error fetching posts: $e');
      } finally {
        loading.hide();
      }
    } else {
      loading.showErrorDialog(
          title: 'Token Missing', message: 'Please sign in again.');
    }
  }
}
