import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../model/comment.dart';
import '../model/current_message.dart';

class LiveChatViewmodel extends ChangeNotifier {
  final List<Comment> _comments = [
    Comment(
      username: "Jake",
      profilePhoto: "Jake.png",
      time: "10s",
      message: "I’m betting Man U to win, Who is in?",
      attachedPhoto: 'play-football-meme.jpg',
      comments: 4,
      likes: 10,
      shares: 2,
      isLiked: false,
      replyComments: [
        Comment(
          username: "Bami",
          profilePhoto: "Bami.jpg",
          time: "Now",
          message: "I agree!",
          likes: 3,
          shares: 1,
          isLiked: false,
        ),
        Comment(
          username: "Alicia",
          profilePhoto: "Alicia.jpg",
          time: "7s",
          message: "Absolutely fantastic!",
          attachedPhoto: 'play-football-meme.jpg',
          likes: 2,
          isLiked: true,
        ),
        Comment(
          username: "Ikechucku",
          profilePhoto: "Ik.jpg",
          time: "3s",
          message: "We couldn't handle him...",
          likes: 4,
          shares: 1,
          isLiked: false,
        ),
        Comment(
          username: "Bami",
          profilePhoto: "Bami.jpg",
          time: "1s",
          message: "I certainly agree!",
          likes: 3,
          shares: 1,
          isLiked: false,
        ),
      ],
    ),
    Comment(
      username: "Alicia",
      profilePhoto: "Alicia.jpg",
      time: "50 mins",
      message: "What a goal!",
      comments: 8,
      likes: 15,
      shares: 4,
      isLiked: true,
      replyComments: [
        Comment(
          username: "Ikechukwu",
          profilePhoto: "Ik.jpg",
          time: "48 mins",
          message: "Unbelievable!",
          likes: 5,
          shares: 2,
          isLiked: true,
        ),
        Comment(
          username: "Samuel",
          profilePhoto: "Samuel.jpg",
          time: "5 mins",
          message: "I've never seen anything like that!",
          attachedPhoto: 'uploaded-photo.png',
          likes: 7,
          shares: 3,
          isLiked: false,
        ),
      ],
    ),
    Comment(
      username: "Peter",
      profilePhoto: "Peter.jpg",
      time: "Now",
      message: "Disappointed with the result...",
      comments: 3,
      likes: 5,
      shares: 1,
      isLiked: false,
    ),
    Comment(
      username: "Ikechukwu",
      profilePhoto: "Ik.jpg",
      time: "2 hours",
      message: "The atmosphere at the stadium was amazing!",
      attachedPhoto: 'attempt-hand-of-god-meme.jpg',
      comments: 2,
      likes: 8,
      shares: 3,
      isLiked: true,
      replyComments: [
        Comment(
          username: "Alicia",
          profilePhoto: "Alicia.jpg",
          time: "1 hour",
          message: "Agreed! We were singing the whole match.",
          attachedPhoto: 'attempt-hand-of-god-meme.jpg',
          likes: 6,
          shares: 2,
          isLiked: true,
        ),
      ],
    ),
    Comment(
      username: "Bami",
      profilePhoto: "Bami.jpg",
      time: "20 mins",
      message: "Another hat-trick for the superstar!",
      comments: 6,
      likes: 12,
      shares: 5,
      isLiked: false,
      replyComments: [
        Comment(
          username: "Jake",
          profilePhoto: "Jake.png",
          time: "15 mins",
          message: "Unstoppable performance!",
          attachedPhoto: 'uploaded-photo.png',
          likes: 9,
          shares: 4,
          isLiked: true,
        ),
        Comment(
          username: "Alicia",
          profilePhoto: "Alicia.jpg",
          time: "3 mins",
          message: "We couldn't handle him...",
          attachedPhoto: 'attempt-hand-of-god-meme.jpg',
          likes: 4,
          shares: 1,
          isLiked: false,
        ),
      ],
    ),
  ];
  String _message = '';
  CurrentMessage _currentMessage = CurrentMessage();
  late FocusNode _textFieldFocusNode;

  List<Comment> get comments => _comments;

  String get message => _message;

  CurrentMessage get currentMessage => _currentMessage;
  FocusNode get textFieldFocusNode => _textFieldFocusNode;

  set message(value) {
    _message = value;
    notifyListeners();
  }

  set textFieldFocusNode(value) => _textFieldFocusNode = value;

  updateCurrentMessage({
    String? message,
    File? attachedPhoto,
    bool? isReply,
    String? replyUsername,
    List<Comment>? replyComments,
  }) {
    _currentMessage.replyUsername =
        replyUsername ?? _currentMessage.replyUsername;
    _currentMessage.message = message ?? _currentMessage.message;
    _currentMessage.attachedPhoto =
        attachedPhoto ?? _currentMessage.attachedPhoto;
    _currentMessage.isReply = isReply ?? _currentMessage.isReply;
    _currentMessage.replyComments =
        replyComments ?? _currentMessage.replyComments;

    //log(jsonEncode(_currentMessage.toString()));
    notifyListeners();
  }

  resetCurrentMessage() {
    _currentMessage = CurrentMessage();
    notifyListeners();
  }

  removeAttachedPhoto() {
    _currentMessage.attachedPhoto = null;
    notifyListeners();
  }

  void toggleCommentLike({required Comment comment}) {
    comment.isLiked = !comment.isLiked!;
    notifyListeners();
  }

  // Get the total number of comments in the Chat
  int getTotalCommentCount() {
    int count = 0;

    // Count main comments
    count += comments.length;

    // Count sub comments
    for (var comment in comments) {
      var me = comment.replyComments;

      if (comment.replyComments != null) {
        count += comment.replyComments!.length;
      }
    }

    return count;
  }

  List<String> getFirstThreeProfileImages() {
    List<String> profileImages = [];

    for (var comment in comments) {
      if (profileImages.length >= 3) {
        break;
      }

      if (comment.profilePhoto != null) {
        profileImages.add(comment.profilePhoto!);
      }
    }

    return profileImages;
  }

  selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.isNotEmpty) {
      File selectedImage = File(result.files.single.path ?? '');

      updateCurrentMessage(attachedPhoto: selectedImage);

      String fileName = result.files.first.name;
      log('Selected file: $fileName');

      notifyListeners();
    }
  }

  void sendMessage() {
    log('Sending a Message');

    Comment newComment = Comment(
      username: 'Daniel',
      profilePhoto: 'Daniel.jpg',
      time: 'Now',
      message: _currentMessage.message,
      //attachedPhoto: 'uploaded-photo.png',
      likes: 0,
      shares: 0,
      isLiked: false,
    );

    if (!currentMessage.isReply) {
      comments.add(newComment);
    } else {
      currentMessage.replyComments!.add(newComment);
    }

    _currentMessage = CurrentMessage();

    notifyListeners();
  }
}
