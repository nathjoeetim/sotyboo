import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:sportboo_mobile_client/core/providers/message_provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';
import 'package:get/get.dart';

class MessagingViewmodel extends ChangeNotifier {
  AllChatProvider chat = Get.put(AllChatProvider());


  late List<ProfileChatModel> _chats;

  MessagingViewmodel() {
    initializeChats();
  }

  void initializeChats()  {
    // chat = Get.put(AllChatProvider());
    _chats = chat.getAllMessages;

    notifyListeners();
  }

  UnmodifiableListView<ProfileChatModel> get chats =>
      UnmodifiableListView(_chats);
  final List<ProfileChatModel> _selectedChats = [];
  UnmodifiableListView<ProfileChatModel> get selectedChats =>
      UnmodifiableListView(_selectedChats);

  bool _isSelectMode = false;
  bool get isSelectMode => _isSelectMode;
  set isSelectMode(bool value) {
    _isSelectMode = value;
    notifyListeners();
  }

  int get newChatLength =>
      _chats.where((chat) => !chat.hasRead!).length;

  void markAsRead(ProfileChatModel chat) {
    int index = _chats.indexOf(chat);
    if (index != -1) {
      _chats[index].hasRead = true;
      notifyListeners();
    }
  }

  void addMessageToChat(ProfileChatModel chat, Message message) {
    int index = _chats.indexOf(chat);
    if (index != -1) {
      _chats[index].messages?.add(message);
      notifyListeners();
    }
  }

  void deleteChat(ProfileChatModel chat) {
    _chats.remove(chat);
    _isSelectMode = false;
    notifyListeners();
  }

  void toggleChatSelection(ProfileChatModel chat) {
    if (_selectedChats.contains(chat)) {
      _selectedChats.remove(chat);
    } else {
      _selectedChats.add(chat);
    }
    notifyListeners();
  }

  void selectAllChats() {
    _selectedChats.clear();
    _selectedChats.addAll(_chats);
    notifyListeners();
  }

  bool areAllChatsSelected() =>
      _selectedChats.isNotEmpty && _selectedChats.length == _chats.length;

  void clearSelectedChats() {
    _selectedChats.clear();
    _isSelectMode = false;
    notifyListeners();
  }

  void deleteSelectedChats() {
    _chats.removeWhere((chat) => _selectedChats.contains(chat));
    _selectedChats.clear();
    _isSelectMode = false;
    notifyListeners();
  }
}
