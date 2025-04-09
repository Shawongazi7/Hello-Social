class RoutesName {
  RoutesName._(); // Private constructor for singleton
  static final RoutesName _instance = RoutesName._();

  factory RoutesName() => _instance;

  // Splash
  static String get splashScreen => '/splash';

  // Auth
  static String get signUpScreen => '/signUp';

  static String get signInScreen => '/signIn';

  static String get forgotPasswordScreen => '/forgotPassword';

  // Navigation
  static String get navigation => '/navigation';

  // Home
  static String get feedScreen => '/feed';

  static String get createPostScreen => '/createPost';

  static String get exploreScreen => '/explore';

  static String get myCommunityScreen => '/myCommunity';

  static String get notificationScreen => '/notification';

  static String get settingsScreen => '/settings';
}
