import 'package:get/get.dart';
import 'package:meetmax/features/home/profile/view_model/user_profile_controller.dart';
import 'package:meetmax/features/home/settings/view_model/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(SettingsController());
    Get.put<UserProfileController>(UserProfileController());
  }
}
