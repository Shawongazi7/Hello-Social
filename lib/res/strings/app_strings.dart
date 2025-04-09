class AppStrings {
  AppStrings._();

  static final AppStrings _instance = AppStrings._();

  factory AppStrings() => _instance;


  static String get appName => 'MeetMax';


  static String get signIn => 'Sign In';

  static String get signUp => 'Sign Up';

  static String get forgotPassword => 'Forgot Password?';

  static String get gettingStarted => 'Getting Started';

  static String get createAnAccountToContinue =>
      'Create an account to continue and connect\nwith the people.';

  static String get welcomeBack => 'Welcome back, you’ve been missed!';

  static String get loginWithGoogle => 'Login with Google';

  static String get loginWithApple => 'Login with Apple';

  static String get or => 'OR';

  static String get yourEmail => 'Your Email';

  static String get yourPassword => 'Your Password';

  static String get createPassword => 'Create Password';

  static String get passwordResetLink =>
      'Enter your details to receive a rest link';

  static String get backToSignIn => 'Back to Sign In';

  static String get rememberMe => 'Remember me';

  static String get youHaventAnyAccount => 'You haven’t any account?';

  static String get alreadyHaveAnAccount => 'Already have an account?';

  static String get yourName => 'Your Name';

  static String get dateOfBirth => 'Date of Birth';

  static String get male => 'Male';

  static String get female => 'Female';

  static String get send => 'Send';

  // Navigation
  static String get feed => 'Feed';

  static String get explore => 'Explore';

  static String get notification => 'Notification';

  static String get myCommunity => 'My Community';

  static String get settings => 'Settings';

  // Home
  static String get searchForSomething => 'Search for Something here...';

  static String get video => 'Video';

  static String get image => 'Image';

  static String get feeling => 'Feeling';

  static String get liveVideo => 'Live Video';

  static String get photoOrVideo => 'Photo/Video';

  static String get visibleFor => 'Visible for';

  static String get recentEvents => 'Recent Events';

  static String get eventNameOne => 'Graduation Ceremony';

  static String get eventNameDetailsOne =>
      'The graduation ceremony is also sometimes called...';

  static String get eventNameTwo => 'Photography Ideas';

  static String get eventNameDetailsTwo =>
      'Reflections. Reflections work because they can create...';

  static String get seeAll => 'See All';

  static String get birthdays => 'Birthdays';

  static String get upcomingBirthdays => 'Upcoming Birthdays';

  static String get seeOthersUpcomingBirthdays =>
      'See 12 others have upcoming birthdays';

  static String get writeOnHisInbox => 'Write on his inbox';

  static String get newPassword => 'New Password';

  static String get confirmPassword => 'Confirm Password';
}
