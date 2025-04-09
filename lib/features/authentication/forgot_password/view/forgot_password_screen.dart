import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/authentication/forgot_password/view_model/forgot_password_controller.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/features/authentication/widgets/custom_auth_app_bar.dart';
import 'package:meetmax/features/authentication/widgets/custom_button.dart';
import 'package:meetmax/features/authentication/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.99),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: Center(
            child: Form(
              key: controller.userFormKey,
              child: Column(
                children: [
                  const CustomAuthAppBar(),
                  const SizedBox(height: 20),
                  _buildHeaderText(),
                  const SizedBox(height: 10),
                  _buildWelcomeText(),
                  const SizedBox(height: 20),
                  _buildAuthContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Text(
      AppStrings.forgotPassword,
      style: AppFonts.heading3Bold.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      AppStrings.passwordResetLink,
      textAlign: TextAlign.center,
      style: AppFonts.bodyMedium.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildAuthContainer() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildEmailFields(),
          const SizedBox(height: 20),
          CustomButton(
            text: AppStrings.send,
            onPressed: () {
              controller.onPressedPasswordReset();
            },
            height: 50,
            backgroundColor: AppColors.blue,
            textStyle: AppFonts.bodyRegular.copyWith(
              color: AppColors.white,
              fontSize: 14,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
          const SizedBox(height: 20),
          _buildFooter(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildEmailFields() {
    return Column(
      children: [
        CustomTextField(
          width: double.infinity,
          height: 60,
          hintText: AppStrings.yourEmail,
          keyboardType: TextInputType.emailAddress,
          borderColor: AppColors.black26,
          textStyle: AppFonts.bodyBold,
          validator: controller.validateEmail,
          controller: controller.emailController,
          icon:
              Image.asset(ImageAssets.mailIcon, width: 16, fit: BoxFit.contain),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          width: double.infinity,
          height: 60,
          hintText: AppStrings.newPassword,
          keyboardType: TextInputType.text,
          borderColor: AppColors.black26,
          textStyle: AppFonts.bodyBold,
          validator: controller.validatePassword,
          controller: controller.newPasswordController,
          icon:
              Image.asset(ImageAssets.lockIcon, width: 16, fit: BoxFit.contain),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          width: double.infinity,
          height: 60,
          hintText: AppStrings.confirmPassword,
          keyboardType: TextInputType.text,
          borderColor: AppColors.black26,
          textStyle: AppFonts.bodyBold,
          controller: controller.confirmPasswordController,
          validator: controller.validatePassword,
          icon:
              Image.asset(ImageAssets.lockIcon, width: 16, fit: BoxFit.contain),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: AppColors.blue,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            AppStrings.backToSignIn,
            style: AppFonts.bodyMedium.copyWith(
              color: AppColors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
