class APIUrls {
  APIUrls._();

  static const String _baseUrl = 'https://socil-api.muhammadsajedulislam.com';

  static String userSignUpPostUrl() => '$_baseUrl/api/v1/auth/register';

  static String userSignInPostUrl() => '$_baseUrl/api/v1/auth/login';

  static String userForgotPasswordPostUrl() =>
      '$_baseUrl/api/v1/auth/reset_password';

  static String userProfileGetUrl({required int? userId}) =>
      '$_baseUrl/api/v1/profile/$userId';

  static String postsGetUrl({int page = 1, int limit = 100}) =>
      '$_baseUrl/api/v1/posts?page=$page&limit=$limit';

  static String createImagePostUrl() => '$_baseUrl/api/v1/posts/image';

  static String createVideoPostUrl() => '$_baseUrl/api/v1/posts/video';
}
