class Post {
  int id;
  int userId;
  String content;
  String? mediaUrl;
  String mediaContentType;
  bool isPublic;
  bool isSharedPost;
  int reactionCount;
  int commentCount;
  int shareCount;
  String updatedAt;
  String createdAt;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    this.mediaUrl,
    required this.mediaContentType,
    required this.isPublic,
    required this.isSharedPost,
    required this.reactionCount,
    required this.commentCount,
    required this.shareCount,
    required this.updatedAt,
    required this.createdAt,
  });

  // Factory method to create a Post from JSON (Image or Video)
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      mediaUrl: json['media'] ?? '',
      mediaContentType: json['mediaContentType'],
      isPublic: json['isPublic'],
      isSharedPost: json['isSharedPost'],
      reactionCount: json['reactionCount'],
      commentCount: json['commentCount'],
      shareCount: json['shareCount'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }

  // ToJson method for sending post data to API
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'media': mediaUrl,
      'mediaContentType': mediaContentType,
      'isPublic': isPublic,
      'isSharedPost': isSharedPost,
    };
  }
}
