import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/authentication/forgot_password/model/password_reset_response.dart';
import 'package:meetmax/res/urls/api_urls.dart';
import 'package:meetmax/services/api_service.dart';
import 'package:meetmax/services/loading_service.dart';
import 'package:meetmax/utils/app_utils.dart';

class ForgotPasswordController extends GetxController {
  final loading = Loading.instance();

  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final userFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
  }

  void onPressedPasswordReset() {
    if (!userFormKey.currentState!.validate()) return;
    loading.show();

    // Sending PATCH request for password reset
    APIService.sendPatchRequest(
      url: APIUrls.userForgotPasswordPostUrl(),
      data: {
        'email': emailController.text,
        'newPassword': newPasswordController.text,
        'confirmPassword': confirmPasswordController.text,
      },
      onSuccess: (response) async {
        // Accessing response.body to get actual data
        final model = PasswordResetResponse.fromMap(response.body);

        if (model.success) {
          loading.hide();
          AppUtils.instance.showInfoToast('Password reset successful!');
          Get.back();
          clearControllers();
        } else {
          // Handle failure
          loading.showErrorDialog(
            title: 'Password Reset Failed!',
            message: model.message,
          );
        }
      },
      onFailed: (error) {
        print('Error: ${error.body}');
        loading.showErrorDialog(
          title: 'Password Reset Failed!',
          message: error.body.toString(),
        );
      },
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  void clearControllers() {
    emailController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }
}
