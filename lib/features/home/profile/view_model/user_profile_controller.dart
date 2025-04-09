import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/home/profile/model/user_profile_model.dart';
import 'package:meetmax/features/home/profile/model/user_profile_model_response.dart';
import 'package:meetmax/res/urls/api_urls.dart';
import 'package:meetmax/services/api_service.dart';
import 'package:meetmax/services/loading_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileController extends GetxController {
  final loading = Loading.instance();
  final _user = Rx<UserProfileModel?>(null);

  UserProfileModel? get user => _user.value;

  void setUserProfileData(UserProfileModel userData) {
    _user.value = userData;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    loading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');
    String? userId = prefs.getString('userId');

    if (token != null) {
      APIService.sendGetRequest(
        url: APIUrls.userProfileGetUrl(
            userId: userId != null ? int.parse(userId) : 0),
        headers: {'Authorization': 'Bearer $token'},
        onSuccess: (response) {
          final model = UserProfileModelResponse.fromMap(response.body);
          if (model.profile != null) {
            setUserProfileData(model.profile!);

            // Delay hiding the loading indicator until after the build phase
            WidgetsBinding.instance.addPostFrameCallback((_) {
              loading.hide();
            });
          } else {
            // Show error dialog outside the build phase
            WidgetsBinding.instance.addPostFrameCallback((_) {
              loading.showErrorDialog(
                title: 'User Profile Fetch Failed!',
                message: 'Failed to fetch user profile data.',
              );
            });
          }
        },
      );
    } else {
      // Handle missing token scenario
      WidgetsBinding.instance.addPostFrameCallback((_) {
        loading.showErrorDialog(
            title: 'Token Missing', message: 'Please sign in again.');
      });
    }
  }
}
