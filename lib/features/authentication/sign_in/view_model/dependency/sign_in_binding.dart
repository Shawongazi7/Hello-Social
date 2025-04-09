import 'package:get/get.dart';
import 'package:meetmax/features/authentication/sign_in/view_model/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
