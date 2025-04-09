// Response Model
import 'package:meetmax/features/home/feed/feed/model/post_model.dart';

class PostModelResponse {
  final bool? success;
  final String? message;
  final PostData? data;

  PostModelResponse({
    this.success,
    this.message,
    this.data,
  });

  factory PostModelResponse.fromMap(Map<String, dynamic>? map) {
    if (map == null) return PostModelResponse();
    return PostModelResponse(
      success: map['success'] as bool?,
      message: map['message'] as String?,
      data: PostData.fromMap(map['data'] as Map<String, dynamic>?),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  PostModelResponse copyWith({
    bool? success,
    String? message,
    PostData? data,
  }) {
    return PostModelResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}