import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/authentication/sign_in/view/sign_in_screen.dart';
import 'package:meetmax/features/authentication/sign_up/model/user_model.dart';
import 'package:meetmax/features/authentication/sign_up/model/user_model_response.dart';
import 'package:meetmax/features/home/feed/feed/view_model/dependency/post_binding.dart';
import 'package:meetmax/features/home/profile/view_model/user_profile_controller.dart';
import 'package:meetmax/features/navigation/view/navigation.dart';
import 'package:meetmax/res/urls/api_urls.dart';
import 'package:meetmax/services/api_service.dart';
import 'package:meetmax/services/loading_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  final loading = Loading.instance();
  final isRememberMe = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final userFormKey = GlobalKey<FormState>();

  final _user = Rx<UserModel?>(null);

  UserModel? get user => _user.value;

  void setUserData(UserModel userData) {
    _user.value = userData;
  }

  @override
  void onReady() {
    super.onReady();
    _loadRememberedCredentials();
  }

  void _loadRememberedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailController.text = prefs.getString('email') ?? '';
    passwordController.text = prefs.getString('password') ?? '';
    isRememberMe.value = prefs.getBool('rememberMe') ?? false;
  }

  void toggleRememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  void onPressedUserSignIn() {
    if (!userFormKey.currentState!.validate()) return;
    if (isRememberMe.value) {
      _saveCredentials();
    } else {
      _clearSavedCredentials();
    }
    loading.show();
    APIService.sendPostRequest(
      url: APIUrls.userSignInPostUrl(),
      data: {
        'email': emailController.text,
        'password': passwordController.text,
      },
      onSuccess: (response) async {
        final model = UserAuthModelResponse.fromMap(response.body);
        if (model.success == true) {
          loading.hide();
          if (model.user != null && model.token != null) {
            setUserData(model.user!);
            await _saveAuthToken(model.token!);
            await _saveUserId(model.user!.id.toString());
            Get.put(UserProfileController());
            Get.offAll(() => const Navigation(), binding: PostBinding());
            clearControllers();
          } else {
            loading.showErrorDialog(
              title: 'Sign In Failed!',
              message: model.message.toString(),
            );
          }
        }
      },
      onFailed: (error) {
        print('Error: ${error.body}'); // Accessing error.body for more details
        loading.showErrorDialog(
          title: 'Sign In Failed!',
          message: error.body.toString(), // Convert to string for display
        );
      },
    );
  }

  Future<void> _saveAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
  }

  Future<void> _saveUserId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', token);
  }

  void _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);
    await prefs.setBool('rememberMe', true);
  }

  void _clearSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.setBool('rememberMe', false);
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
    passwordController.clear();
  }
}
