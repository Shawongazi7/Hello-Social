import 'package:get/get.dart';
import 'package:meetmax/features/authentication/forgot_password/view_model/dependency/forgot_password_binding.dart';
import 'package:meetmax/features/authentication/sign_in/view_model/dependency/sign_in_binding.dart';
import 'package:meetmax/features/authentication/sign_up/view_model/dependency/sign_up_binding.dart';
import 'package:meetmax/features/home/feed/create_post/view/create_post_screen.dart';
import 'package:meetmax/features/home/feed/create_post/view_model/dependency/create_post_binding.dart';
import 'package:meetmax/features/home/feed/feed/view_model/dependency/post_binding.dart';
import 'package:meetmax/features/home/profile/view_model/dependency/user_profile_binding.dart';
import 'package:meetmax/features/home/settings/view_model/dependency/settings_binding.dart';
import 'package:meetmax/res/routes/routes_name.dart';
import 'package:meetmax/features/authentication/forgot_password/view/forgot_password_screen.dart';
import 'package:meetmax/features/authentication/sign_in/view/sign_in_screen.dart';
import 'package:meetmax/features/authentication/sign_up/view/sign_up_screen.dart';
import 'package:meetmax/features/home/explore/explore_screen.dart';
import 'package:meetmax/features/home/feed/feed/view/feed_screen.dart';
import 'package:meetmax/features/home/my_community/my_community_screen.dart';
import 'package:meetmax/features/home/notification/notification_screen.dart';
import 'package:meetmax/features/home/settings/view/settings_screen.dart';
import 'package:meetmax/features/navigation/view/navigation.dart';
import 'package:meetmax/features/navigation/view_model/dependency/navigation_binding.dart';
import 'package:meetmax/features/splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._(); // Private constructor for singleton
  static final AppRoutes _instance = AppRoutes._();

  factory AppRoutes() => _instance;

  // Method to return a list of routes
  static List<GetPage<dynamic>> appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RoutesName.signInScreen,
          page: () => SignInScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.downToUp,
          binding: SignInBinding(),
        ),
        GetPage(
          name: RoutesName.signUpScreen,
          page: () => SignUpScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.downToUp,
          binding: SignUpBinding(),
        ),
        GetPage(
          name: RoutesName.forgotPasswordScreen,
          page: () => const ForgotPasswordScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
          binding: ForgotPasswordBinding(),
        ),
        GetPage(
            name: RoutesName.navigation,
            page: () => Navigation(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.fade,
            binding: NavigationBinding()),
        GetPage(
          name: RoutesName.feedScreen,
          page: () => FeedScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fade,
          bindings: [
            UserProfileBinding(),
            PostBinding()
          ], // Ensure PostBinding is here
        ),
        GetPage(
          name: RoutesName.createPostScreen,
          page: () => CreatePostScreen(),
          bindings: [CreatePostBinding(), UserProfileBinding()],
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.myCommunityScreen,
          page: () => MyCommunityScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fade,
        ),
        GetPage(
          name: RoutesName.exploreScreen,
          page: () => ExploreScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fade,
        ),
        GetPage(
          name: RoutesName.notificationScreen,
          page: () => NotificationScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fade,
        ),
        GetPage(
          name: RoutesName.settingsScreen,
          page: () => SettingsScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fade,
          binding: SettingsBinding(),
        ),
      ];
}
