import 'package:get/get.dart';
import 'package:meetmax/features/authentication/forgot_password/view_model/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
