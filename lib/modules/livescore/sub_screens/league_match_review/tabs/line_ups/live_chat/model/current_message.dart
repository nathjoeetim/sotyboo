import 'dart:io';

import 'comment.dart';

class CurrentMessage {
  String? message;
  File? attachedPhoto;
  bool isReply;
  String? replyUsername;
  List<Comment>? replyComments;

  CurrentMessage({
    this.message,
    this.attachedPhoto,
    this.isReply = false,
    this.replyUsername,
    this.replyComments,
  });
}
