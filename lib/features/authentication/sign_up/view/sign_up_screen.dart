import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/features/authentication/sign_up/view_model/sign_up_controller.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';
import 'package:meetmax/res/routes/routes_name.dart';
import 'package:meetmax/res/strings/app_strings.dart';
import 'package:meetmax/features/authentication/widgets/custom_auth_app_bar.dart';
import 'package:meetmax/features/authentication/widgets/custom_button.dart';
import 'package:meetmax/features/authentication/widgets/custom_text_field.dart';
import 'package:meetmax/features/authentication/widgets/gender_selection.dart';
import 'package:meetmax/utils/app_utils.dart';

class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({super.key});

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
                  CustomAuthAppBar(),
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
      AppStrings.gettingStarted,
      style: AppFonts.heading3Bold.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      AppStrings.createAnAccountToContinue,
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
          _buildSocialLoginButtons(),
          const SizedBox(height: 20),
          _buildDividerWithText(),
          const SizedBox(height: 20),
          _buildUserInfoFields(),
          const SizedBox(height: 20),
          CustomButton(
            text: AppStrings.signUp,
            onPressed: () {
              controller.onPressedUserSignUp();
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

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(
          AppStrings.loginWithGoogle,
          ImageAssets.googleIcon,
          onPressed: () {
            AppUtils.instance
                .showInfoToast('Google login is not implemented yet.');
          },
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          AppStrings.loginWithApple,
          ImageAssets.appleIcon,
          onPressed: () {
            AppUtils.instance
                .showInfoToast('Apple login is not implemented yet.');
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton(String text, String icon,
      {required VoidCallback onPressed}) {
    return Expanded(
      child: CustomButton(
        text: text,
        onPressed: onPressed,
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        icon: Image.asset(icon, width: 16, fit: BoxFit.contain),
        textStyle: AppFonts.bodyMedium.copyWith(
          color: AppColors.black54,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: AppColors.white70,
      ),
    );
  }

  Widget _buildDividerWithText() {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.grey, thickness: 0.5)),
        const SizedBox(width: 10),
        Text(AppStrings.or, style: AppFonts.bodyBold),
        const SizedBox(width: 10),
        Expanded(child: Divider(color: AppColors.grey, thickness: 0.5)),
      ],
    );
  }

  Widget _buildUserInfoFields() {
    return Column(
      children: [
        CustomTextField(
          width: double.infinity,
          height: 60,
          controller: controller.emailController,
          hintText: AppStrings.yourEmail,
          keyboardType: TextInputType.emailAddress,
          validator: controller.validateEmail,
          borderColor: AppColors.black26,
          textStyle: AppFonts.bodyBold,
          icon:
              Image.asset(ImageAssets.mailIcon, width: 16, fit: BoxFit.contain),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          width: double.infinity,
          height: 60,
          hintText: AppStrings.yourName,
          controller: controller.nameController,
          keyboardType: TextInputType.name,
          validator: controller.validateName,
          borderColor: AppColors.black26,
          textStyle: AppFonts.bodyBold,
          icon:
              Image.asset(ImageAssets.nameIcon, width: 16, fit: BoxFit.contain),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          width: double.infinity,
          height: 60,
          controller: controller.passwordController,
          hintText: AppStrings.createPassword,
          keyboardType: TextInputType.text,
          validator: controller.validatePassword,
          borderColor: AppColors.black26,
          textStyle: AppFonts.bodyBold,
          icon:
              Image.asset(ImageAssets.lockIcon, width: 16, fit: BoxFit.contain),
          showPassword: true,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          width: double.infinity,
          height: 60,
          controller: controller.dateOfBirthController,
          hintText: AppStrings.dateOfBirth,
          validator: controller.validateDateOfBirth,
          keyboardType: TextInputType.datetime,
          borderColor: AppColors.black26,
          textStyle: AppFonts.bodyBold,
          icon: Image.asset(ImageAssets.calendarIcon,
              width: 16, fit: BoxFit.contain),
        ),
        const SizedBox(height: 15),
        GenderSelection(
          onGenderSelected: (selectedGender) {
            controller.genderController.text = selectedGender;
          },
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAnAccount,
          style: AppFonts.bodyMedium.copyWith(
            color: AppColors.black87,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            Get.offNamed(RoutesName.signInScreen);
          },
          child: Text(
            AppStrings.signIn,
            style: AppFonts.bodyMedium.copyWith(
              color: AppColors.blue,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
