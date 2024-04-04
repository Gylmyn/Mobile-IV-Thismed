// ignore_for_file: file_names

class User {
  String id;
  String username;
  String contentTittle;
  String avatar;
  String image;
  String like;
  String dislike;
  String comment;
  String createdAt;

  User({
    required this.id,
    required this.username,
    required this.contentTittle,
    required this.comment,
    required this.avatar,
    required this.like,
    required this.dislike,
    required this.createdAt,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        image: json["image"],
        like: json["like"],
        dislike: json["dislike"],
        avatar: json["avatar"],
        createdAt: json["createdAt"],
        contentTittle: json["contentTittle"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "avatar": avatar,
        "image": image,
        "contentTittle": contentTittle,
        "like": like,
        "dislike": dislike,
        "comment": comment,
        "createdAt": createdAt,
      };
}
