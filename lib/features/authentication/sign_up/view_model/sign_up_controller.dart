import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/authentication/sign_in/view/sign_in_screen.dart';
import 'package:meetmax/features/authentication/sign_in/view_model/dependency/sign_in_binding.dart';
import 'package:meetmax/features/authentication/sign_up/model/user_model_response.dart';
import 'package:meetmax/res/urls/api_urls.dart';
import 'package:meetmax/services/api_service.dart';
import 'package:meetmax/services/loading_service.dart';

class SignUpController extends GetxController {
  final loading = Loading.instance();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final userFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
  }

  void onPressedUserSignUp() {
    if (!userFormKey.currentState!.validate()) return;
    loading.show();
    APIService.sendPostRequest(
      url: APIUrls.userSignUpPostUrl(),
      data: {
        'firstName': nameController.text,
        'lastName': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'gender': genderController.text,
        'dateOfBirth': dateOfBirthController.text,
      },
      onSuccess: (response) async {
        // Accessing response.body to get actual data
        final model = UserAuthModelResponse.fromMap(response.body);

        if (model.success == true) {
          loading.hide();
          Get.offAll(() => SignInScreen(), binding: SignInBinding());
          clearControllers();
        } else {
          loading.showErrorDialog(
            title: 'Account Creation Failed!',
            message: model.message.toString(),
          );
        }
      },
      onFailed: (error) {
        print('Error: ${error.body}'); // Accessing error.body for more details
        loading.showErrorDialog(
          title: 'Account Creation Failed!',
          message: error.body.toString(), // Convert to string for display
        );
      },
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
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

  String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    }

    // Try to parse the date
    DateTime? dob;
    try {
      dob = DateFormat('dd-MM-yyyy')
          .parseStrict(value); // Specify the date format (e.g., 'yyyy-MM-dd')
    } catch (e) {
      return 'Please enter a valid date (dd-MM-yyyy)';
    }

    // Check if the date is in the future
    if (dob.isAfter(DateTime.now())) {
      return 'Date of birth cannot be in the future';
    }

    // Check if the user is at least 18 years old
    final age = DateTime.now().difference(dob).inDays ~/ 365;
    if (age < 18) {
      return 'You must be at least 18 years old';
    }

    return null; // Date of birth is valid
  }

  void clearControllers() {
    nameController.clear();
    genderController.clear();
    emailController.clear();
    passwordController.clear();
    dateOfBirthController.clear();
  }
}
