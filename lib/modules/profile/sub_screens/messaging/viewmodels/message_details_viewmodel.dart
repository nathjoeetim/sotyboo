import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';

class MessageDetailsViewmodel extends ChangeNotifier {
  MessageDetailsViewmodel({
    required this.messagingViewmodel,
  });

  final MessagingViewmodel messagingViewmodel;

  late ProfileChatModel _chat;
  Message _currentMessage = Message(message: '');
  //String _message = '';
  //File _selectedImage = File('');

  initialize(ProfileChatModel chat) {
    _chat = chat;
  }


  List<Message>? get messages => _chat.messages;
  Message get currentMessage => _currentMessage;

  //String get message => _message;
  //File? get selectedImage => _selectedImage;

  /*set message(value) {
    _message = value;
    notifyListeners();
  }*/

  updateCurrentMessage({
    String? message,
    //String? time,
    File? photo,
  }) {
    _currentMessage.message = message ?? _currentMessage.message;
    _currentMessage.photo = photo ?? _currentMessage.photo;

    //log(jsonEncode(_currentMessage.toString()));
    notifyListeners();
  }

  resetCurrentMessage() {
    _currentMessage = Message(message: '');
    notifyListeners();
  }

  removeAttachedPhoto() {
    _currentMessage.photo = null;
    notifyListeners();
  }

  selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.isNotEmpty) {
      File selectedImage = File(result.files.single.path ?? '');

      updateCurrentMessage(photo: selectedImage);

      String fileName = result.files.first.name;
      log('Selected file: $fileName');

      notifyListeners();
    }
  }

  void sendMessage() {
    log('Sending a Message');

    Message newMessage = Message(
      sender: 'You',
      time: 'Now',
      message: _currentMessage.message,
      photo: _currentMessage.photo,
    );

    messagingViewmodel.addMessageToChat(_chat, newMessage);

    _currentMessage = Message();

    notifyListeners();
  }
}
