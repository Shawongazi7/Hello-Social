import 'package:meetmax/features/home/feed/create_post/model/post.dart';

class PostResponse {
  bool success;
  String message;
  Post data;

  PostResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  // Factory method to create a PostResponse from JSON
  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      success: json['success'],
      message: json['message'],
      data: Post.fromJson(json['data']['post']),
    );
  }
}
