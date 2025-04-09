class PasswordResetResponse {
  final bool success;
  final String message;
  final Map<String, dynamic> data;

  PasswordResetResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  // Factory constructor to create an instance from a map
  factory PasswordResetResponse.fromMap(Map<String, dynamic> map) {
    return PasswordResetResponse(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: map['data'] ?? {},
    );
  }
}
