import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';

class MessagingViewmodel extends ChangeNotifier {
  final List<ProfileChatModel> _chats = [
    ProfileChatModel(
      isRead: false,
      title: 'How to Deposit money on SiuuSport',
      messages: [
        Message(sender: 'You', message: 'How are you', time: '1 hour'),
        Message(
            sender: 'SiuuSports',
            message: 'Hey Jake,\n\nTo deposit money follow the steps:\n',
            time: '21 mins'),
        Message(
            sender: 'You',
            message: 'Okay, thanks for the assist.',
            time: '5 secs'),
      ],
    ),
    ProfileChatModel(
      isRead: false,
      title: 'How to Deposit money on SiuuSport',
      messages: [
        Message(sender: 'You', message: 'How are you', time: '1 hour'),
        Message(
            sender: 'SiuuSports',
            message: 'Hey Jake,\nTo deposit money follow the steps..',
            time: '21 mins'),
      ],
    ),
    ProfileChatModel(
      isRead: true,
      title: 'How to Deposit money on SiuuSport',
      messages: [
        Message(
            sender: 'SiuuSports',
            message: 'Hey Jake,\nTo deposit money follow the steps..',
            time: '21 mins'),
      ],
    ),
    ProfileChatModel(
      isRead: false,
      title: 'How to Deposit money on SiuuSport',
      messages: [
        Message(sender: 'You', message: 'How are you', time: '1 hour'),
        Message(
            sender: 'SiuuSports',
            message: 'Hey Jake,\n\nTo deposit money follow the steps:\n',
            time: '21 mins'),
        Message(
            sender: 'You',
            message: 'Okay, thanks for the assist.',
            time: '5 secs'),
      ],
    ),
    ProfileChatModel(
      isRead: false,
      title: 'How to Deposit money on SiuuSport',
      messages: [
        Message(sender: 'You', message: 'How are you', time: '1 hour'),
        Message(
            sender: 'SiuuSports',
            message: 'Hey Jake,\nTo deposit money follow the steps..',
            time: '21 mins'),
      ],
    ),
    ProfileChatModel(
      isRead: true,
      title: 'How to Deposit money on SiuuSport',
      messages: [
        Message(
            sender: 'SiuuSports',
            message: 'Hey Jake,\nTo deposit money follow the steps..',
            time: '21 mins'),
      ],
    ),
  ];

  bool _isSelectMode = false;

  UnmodifiableListView<ProfileChatModel> get chats =>
      UnmodifiableListView(_chats);

  List<ProfileChatModel> _selectedChats = [];
  UnmodifiableListView<ProfileChatModel> get selectedChats =>
      UnmodifiableListView(_selectedChats);

  bool get isSelectMode {
    if (_isSelectMode) {
      return true;
    } else if (_selectedChats.isNotEmpty) {
      return true;
    }
    return false;
  }

  /*  UnmodifiableListView<ProfileMessageModel> getReadNotifications() {
    final readNotifications =
        _messages.where((notification) => notification.isRead!).toList();
    return UnmodifiableListView(readNotifications);
  }
*/
  int get newChatLength {
    final newChat = _chats.where((chat) => !chat.isRead!).toList();
    return newChat.length;
  }

  /* bool get hasUnreadMessages =>
      _messages.any((message) => !message.isRead!);*/
  set isSelectMode(value) {
    _isSelectMode = value;
    notifyListeners();
  }

  markAsRead(ProfileChatModel chat) {
    /* _notifications[index].isRead = true;
    notifyListeners();*/

    int index = _chats.indexOf(chat);
    if (index != -1) {
      _chats[index].isRead = true;
      notifyListeners();
    }
  }

  addMessageToChat(ProfileChatModel chat, Message message) {
    int index = _chats.indexOf(chat);
    if (index != -1) {
      _chats[index].messages?.add(message);
      notifyListeners();
    }
  }

  deleteChat(ProfileChatModel chat) {
    _chats.remove(chat);
    _isSelectMode = false;
    notifyListeners();
  }

/*  void toggleSelectMode() {
    if (isSelectMode) {
      clearSelectedChats();
    } else {
      // Enter selection mode
    }
  }*/

  toggleChatSelection(ProfileChatModel chat) {
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

  bool areAllChatsSelected() {
    if (_selectedChats.isEmpty) {
      return false;
    }
    return _selectedChats.length == _chats.length;
  }

  clearSelectedChats() {
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
