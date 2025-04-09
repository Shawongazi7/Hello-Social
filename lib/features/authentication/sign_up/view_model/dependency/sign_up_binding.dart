import 'package:get/get.dart';
import 'package:meetmax/features/authentication/sign_up/view_model/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
