import 'dart:convert';
import 'dart:io';

class ProfileChatModel {
  ProfileChatModel({
    this.hasRead = false,
    this.title,
    this.messages,
  });

  bool? hasRead;
  String? title;
  List<Message>? messages;
}

class Message {
  String? id;
  String? sender;
  String? time;
  String? message;
  File? photo;

  Message({
    this.id,
    this.sender,
    this.time,
    this.message,
    this.photo,
  });
}

class DataExtractor {
  ProfileChatModel extractProfileChatModel(Map<String, dynamic> data) {
    return ProfileChatModel(
      hasRead: data['messages']?.any((message) => message['hasRead'] ?? false) ?? false,
      title: data['title'],
      messages: (data['messages'] as List<dynamic>?)
          ?.map((message) => extractMessage(message))
          .toList(),
    );
  }

  Message extractMessage(Map<String, dynamic> message) {
    return Message(
      id: message['id'],
      sender: message['sender'],
      time: message['time'],
      message: message['message'],
      photo: message['photo'] != null ? File(message['photo']) : null,
    );
  }
}


