import 'package:get/get.dart';
import 'package:meetmax/features/home/feed/create_post/view_model/create_post_controller.dart';
import 'package:meetmax/features/home/profile/view_model/user_profile_controller.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileController>(() => UserProfileController());
    Get.lazyPut<CreatePostController>(() => CreatePostController());
  }
}
