class Comment {
  String? username;
  String? profilePhoto;
  String? time;
  String? message;
  String? attachedPhoto;
  int? comments;
  int? likes;
  int? shares;
  bool? isLiked;
  List<Comment>? replyComments;

  Comment({
    this.username,
    this.profilePhoto,
    this.time,
    this.message,
    this.attachedPhoto,
    this.comments,
    this.likes,
    this.shares,
    this.isLiked,
    this.replyComments,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      username: json['username'],
      profilePhoto: json['profilePhoto'],
      time: json['time'],
      message: json['message'],
      attachedPhoto: json['attachedPhoto'],
      comments: json['comments'],
      likes: json['likes'],
      shares: json['shares'],
      isLiked: json['isLiked'],
      replyComments: json['replyComment'] != null
          ? List<Comment>.from(
              json['replyComment'].map((x) => Comment.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'profilePhoto': profilePhoto,
      'time': time,
      'message': message,
      'attachedPhoto': attachedPhoto,
      'comments': comments,
      'likes': likes,
      'shares': shares,
      'isLiked': isLiked,
      'replyComment': replyComments != null
          ? replyComments!.map((x) => x.toJson()).toList()
          : null,
    };
  }

  List<String>? getFirstThreeReplyProfilePhotos() {
    if (replyComments == null || replyComments!.isEmpty) {
      return [];
    }

    List<String>? profilePhotos = [];
    int count = 0;

    for (Comment reply in replyComments!) {
      if (reply.profilePhoto != null) {
        profilePhotos.add(reply.profilePhoto!);
        count++;

        if (count == 3) {
          break;
        }
      }
    }

    return profilePhotos;
  }
}

/*
class Comment {
  String? username;
  String? profilePhoto;
  String? time;
  String? message;
  String? attachedPhoto;
  int? comments;
  int? likes;
  int? shares;
  bool? isLiked;
  List<ReplyComment>? replyComments;

  Comment({
    this.username,
    this.profilePhoto,
    this.time,
    this.message,
    this.attachedPhoto,
    this.comments,
    this.likes,
    this.shares,
    this.isLiked,
    this.replyComments,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      username: json['username'],
      profilePhoto: json['profilePhoto'],
      time: json['time'],
      message: json['message'],
      attachedPhoto: json['attachedPhoto'],
      comments: json['comments'],
      likes: json['likes'],
      shares: json['shares'],
      isLiked: json['isLiked'],
      replyComments: json['replyComment'] != null
          ? List<ReplyComment>.from(
              json['replyComment'].map((x) => ReplyComment.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'profilePhoto': profilePhoto,
      'time': time,
      'message': message,
      'attachedPhoto': attachedPhoto,
      'comments': comments,
      'likes': likes,
      'shares': shares,
      'isLiked': isLiked,
      'replyComment': replyComments != null
          ? replyComments!.map((x) => x.toJson()).toList()
          : null,
    };
  }

  List<String>? getFirstThreeReplyProfilePhotos() {
    if (replyComments == null || replyComments!.isEmpty) {
      return [];
    }

    List<String>? profilePhotos = [];
    int count = 0;

    for (ReplyComment reply in replyComments!) {
      if (reply.profilePhoto != null) {
        profilePhotos.add(reply.profilePhoto!);
        count++;

        if (count == 3) {
          break;
        }
      }
    }

    return profilePhotos;
  }
}

class ReplyComment {
  String? username;
  String? profilePhoto;
  String? time;
  String? message;
  String? attachedPhoto;
  int? likes;
  int? shares;
  bool? isLiked;

  ReplyComment({
    this.username,
    this.profilePhoto,
    this.time,
    this.message,
    this.attachedPhoto,
    this.likes,
    this.shares,
    this.isLiked,
  });

  factory ReplyComment.fromJson(Map<String, dynamic> json) {
    return ReplyComment(
      username: json['username'],
      profilePhoto: json['profilePhoto'],
      time: json['time'],
      message: json['message'],
      attachedPhoto: json['attachedPhoto'],
      likes: json['likes'],
      shares: json['shares'],
      isLiked: json['isLiked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'profilePhoto': profilePhoto,
      'time': time,
      'message': message,
      'attachedPhoto': attachedPhoto,
      'likes': likes,
      'shares': shares,
      'isLiked': isLiked,
    };
  }
}
*/
