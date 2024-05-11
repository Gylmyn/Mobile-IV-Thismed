class Users {
  final String id;
  final String username;
  final String email;
  final String password;
  final String googleUserId;
  final String avatar;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Post>? posts;

  Users({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.googleUserId,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    required this.posts,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    List<Post> posts = [];
    if (json['posts'] != null) {
      posts = List<Post>.from(
          json['posts'].map((postJson) => Post.fromJson(postJson)));
    }
    return Users(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      googleUserId: json['googleUserId'],
      avatar: json['avatar'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      posts: posts,
    );
  }
}

class Post {
  final String id;
  final String title;
  final String image;
  late final DateTime createdAt;
  final DateTime updatedAt;
  final int likes;
  final int dislikes;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.likes,
    required this.dislikes,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    List<Comment> comments = [];
    if (json['comments'] != null) {
      comments = List<Comment>.from(
          json['comments'].map((commentJson) => Comment.fromJson(commentJson)));
    }
    return Post(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      likes: json['likes'],
      dislikes: json['dislikes'],
      comments: comments,
    );
  }
}

class Comment {
  final String id;
  final String content;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
    required this.id,
    required this.content,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
