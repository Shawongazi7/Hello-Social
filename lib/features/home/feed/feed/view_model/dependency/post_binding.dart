import 'package:get/get.dart';
import 'package:meetmax/features/home/feed/feed/view_model/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(PostController(), permanent: true);
  }
}
