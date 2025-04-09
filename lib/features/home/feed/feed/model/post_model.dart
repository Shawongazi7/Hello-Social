// Post Owner Model
class PostOwner {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? gender;
  final String? email;
  final String? phone;
  final String? profilePicture;
  final String? coverPhoto;
  final String? bio;
  final bool? isRegistered;
  final bool? isVerified;
  final bool? isBanned;
  final String? address;
  final String? relationship;
  final String? hometown;
  final String? work;
  final String? education;
  final bool? isActive;
  final String? lastActive;
  final String? createdAt;
  final String? updatedAt;

  PostOwner({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.email,
    this.phone,
    this.profilePicture,
    this.coverPhoto,
    this.bio,
    this.isRegistered,
    this.isVerified,
    this.isBanned,
    this.address,
    this.relationship,
    this.hometown,
    this.work,
    this.education,
    this.isActive,
    this.lastActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PostOwner.fromMap(Map<String, dynamic>? map) {
    if (map == null) return PostOwner();
    return PostOwner(
      id: map['id'] as int?,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      dateOfBirth: map['dateOfBirth'] as String?,
      gender: map['gender'] as String?,
      email: map['email'] as String?,
      phone: map['phone'] as String?,
      profilePicture: map['profilePicture'] as String?,
      coverPhoto: map['coverPhoto'] as String?,
      bio: map['bio'] as String?,
      isRegistered: map['isRegistered'] as bool?,
      isVerified: map['isVerified'] as bool?,
      isBanned: map['isBanned'] as bool?,
      address: map['address'] as String?,
      relationship: map['relationship'] as String?,
      hometown: map['hometown'] as String?,
      work: map['work'] as String?,
      education: map['education'] as String?,
      isActive: map['isActive'] as bool?,
      lastActive: map['lastActive'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'email': email,
      'phone': phone,
      'profilePicture': profilePicture,
      'coverPhoto': coverPhoto,
      'bio': bio,
      'isRegistered': isRegistered,
      'isVerified': isVerified,
      'isBanned': isBanned,
      'address': address,
      'relationship': relationship,
      'hometown': hometown,
      'work': work,
      'education': education,
      'isActive': isActive,
      'lastActive': lastActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  PostOwner copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? gender,
    String? email,
    String? phone,
    String? profilePicture,
    String? coverPhoto,
    String? bio,
    bool? isRegistered,
    bool? isVerified,
    bool? isBanned,
    String? address,
    String? relationship,
    String? hometown,
    String? work,
    String? education,
    bool? isActive,
    String? lastActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return PostOwner(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      coverPhoto: coverPhoto ?? this.coverPhoto,
      bio: bio ?? this.bio,
      isRegistered: isRegistered ?? this.isRegistered,
      isVerified: isVerified ?? this.isVerified,
      isBanned: isBanned ?? this.isBanned,
      address: address ?? this.address,
      relationship: relationship ?? this.relationship,
      hometown: hometown ?? this.hometown,
      work: work ?? this.work,
      education: education ?? this.education,
      isActive: isActive ?? this.isActive,
      lastActive: lastActive ?? this.lastActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

// Post Model
class Post {
  final int? id;
  final int? userId;
  final String? content;
  final String? image;
  final String? video;
  final int? reactionCount;
  final int? commentCount;
  final int? shareCount;
  final bool? isPublic;
  final String? mediaContentType;
  final bool? isSharedPost;
  final int? mainPostId;
  final String? createdAt;
  final String? updatedAt;
  final PostOwner? originalPostOwner;
  final bool? isSharedPostDeleted;
  final PostOwner? postOwner;
  final List<Map<String, dynamic>>? reactionsByUserId;

  Post({
    this.id,
    this.userId,
    this.content,
    this.image,
    this.video,
    this.reactionCount,
    this.commentCount,
    this.shareCount,
    this.isPublic,
    this.mediaContentType,
    this.isSharedPost,
    this.mainPostId,
    this.createdAt,
    this.updatedAt,
    this.originalPostOwner,
    this.isSharedPostDeleted,
    this.postOwner,
    this.reactionsByUserId,
  });

  factory Post.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Post();
    return Post(
      id: map['id'] as int?,
      userId: map['userId'] as int?,
      content: map['content'] as String?,
      image: map['image'] as String?,
      video: map['video'] as String?,
      reactionCount: map['reactionCount'] as int?,
      commentCount: map['commentCount'] as int?,
      shareCount: map['shareCount'] as int?,
      isPublic: map['isPublic'] as bool?,
      mediaContentType: map['mediaContentType'] as String?,
      isSharedPost: map['isSharedPost'] as bool?,
      mainPostId: map['mainPostId'] as int?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      originalPostOwner: map['originalPostOwner'] != null
          ? PostOwner.fromMap(map['originalPostOwner'] as Map<String, dynamic>?)
          : null,
      isSharedPostDeleted: map['isSharedPostDeleted'] as bool?,
      postOwner: PostOwner.fromMap(map['postOwner'] as Map<String, dynamic>?),
      reactionsByUserId: (map['reactionsByUserId'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'image': image,
      'video': video,
      'reactionCount': reactionCount,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'isPublic': isPublic,
      'mediaContentType': mediaContentType,
      'isSharedPost': isSharedPost,
      'mainPostId': mainPostId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'originalPostOwner': originalPostOwner?.toMap(),
      'isSharedPostDeleted': isSharedPostDeleted,
      'postOwner': postOwner?.toMap(),
      'reactionsByUserId': reactionsByUserId,
    };
  }

  Post copyWith({
    int? id,
    int? userId,
    String? content,
    String? image,
    String? video,
    int? reactionCount,
    int? commentCount,
    int? shareCount,
    bool? isPublic,
    String? mediaContentType,
    bool? isSharedPost,
    int? mainPostId,
    String? createdAt,
    String? updatedAt,
    PostOwner? originalPostOwner,
    bool? isSharedPostDeleted,
    PostOwner? postOwner,
    List<Map<String, dynamic>>? reactionsByUserId, // Updated type to match
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      image: image ?? this.image,
      video: video ?? this.video,
      reactionCount: reactionCount ?? this.reactionCount,
      commentCount: commentCount ?? this.commentCount,
      shareCount: shareCount ?? this.shareCount,
      isPublic: isPublic ?? this.isPublic,
      mediaContentType: mediaContentType ?? this.mediaContentType,
      isSharedPost: isSharedPost ?? this.isSharedPost,
      mainPostId: mainPostId ?? this.mainPostId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      originalPostOwner: originalPostOwner ?? this.originalPostOwner,
      isSharedPostDeleted: isSharedPostDeleted ?? this.isSharedPostDeleted,
      postOwner: postOwner ?? this.postOwner,
      reactionsByUserId:
          reactionsByUserId ?? this.reactionsByUserId, // Added this line
    );
  }
}

class PostData {
  final List<Post>? posts;
  final int? totalPosts;
  final int? currentPage;
  final int? totalPages;

  PostData({
    this.posts,
    this.totalPosts,
    this.currentPage,
    this.totalPages,
  });

  factory PostData.fromMap(Map<String, dynamic>? map) {
    if (map == null) return PostData();
    return PostData(
      posts: map['posts'] != null
          ? List<Post>.from(
              (map['posts'] as List)
                  .map((x) => Post.fromMap(x as Map<String, dynamic>?)),
            )
          : null,
      totalPosts: map['totalPosts'] as int?,
      currentPage: map['currentPage'] as int?,
      totalPages: map['totalPages'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'posts': posts?.map((x) => x.toMap()).toList(),
      'totalPosts': totalPosts,
      'currentPage': currentPage,
      'totalPages': totalPages,
    };
  }

  PostData copyWith({
    List<Post>? posts,
    int? totalPosts,
    int? currentPage,
    int? totalPages,
  }) {
    return PostData(
      posts: posts ?? this.posts,
      totalPosts: totalPosts ?? this.totalPosts,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
