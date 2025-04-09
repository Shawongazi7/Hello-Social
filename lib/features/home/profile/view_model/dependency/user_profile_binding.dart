import 'package:get/get.dart';
import 'package:meetmax/features/home/profile/view_model/user_profile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserProfileController>(UserProfileController(), permanent: true);
  }
}
