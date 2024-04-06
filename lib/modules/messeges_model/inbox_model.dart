import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sportboo_mobile_client/modules/authentication/endpoints_constants.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';

// Define the Conversation class
class Conversation {
  final String message;
  final List<Data> data;
  final Pagination pagination;

  Conversation({
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    List<Data> dataList = [];
    for (var item in json['data']) {
      dataList.add(Data.fromJson(item));
    }
    return Conversation(
      message: json['message'],
      data: dataList,
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

// Define the Data class
class Data {
  final int id;
  final String title;
  final String initiatedBy;
  final int adminId;
  final int userId;
  final String createdAt;
  final List<Messages> messages;

  Data({
    required this.id,
    required this.title,
    required this.initiatedBy,
    required this.adminId,
    required this.userId,
    required this.createdAt,
    required this.messages,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<Messages> messageList = [];
    for (var item in json['messages']) {
      messageList.add(Messages.fromJson(item));
    }
    return Data(
      id: json['id'],
      title: json['title'],
      initiatedBy: json['initiatedBy'],
      adminId: json['adminId'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      messages: messageList,
    );
  }
}

// Define the Message class
class Messages {
  final int id;
  final bool hasRead;
  final String message;
  final String? fileUri;
  final String owner;
  final int conversationId;
  final String createdAt;

  Messages({
    required this.id,
    required this.hasRead,
    required this.message,
    required this.fileUri,
    required this.owner,
    required this.conversationId,
    required this.createdAt,
  });

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      id: json['id'],
      hasRead: json['hasRead'],
      message: json['message'],
      fileUri: json['fileUri'],
      owner: json['owner'],
      conversationId: json['conversationId'],
      createdAt: json['createdAt'],
    );
  }
}

// Define the Pagination class
class Pagination {
  final bool next;
  final bool prev;

  Pagination({
    required this.next,
    required this.prev,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      next: json['next'],
      prev: json['prev'],
    );
  }
}
Future<List<ProfileChatModel>> getAllMessagesFn() async {
  // URL for the endpoint
  String url = '$baseUrl/messages/conversations';

  try {
    // Send GET request
    http.Response response = await http.get(Uri.parse(url),
      headers: {'Authorization': 'Bearer $authToken'},
    );
    // Check if the request was successful
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      // Parse JSON data
      Map<String, dynamic> jsonData = json.decode(response.body);
      // Create a Conversation object from JSON data
      Conversation conversations = Conversation.fromJson(jsonData);

      List<ProfileChatModel> profileChatModels = conversations.data.map((conversationItem) {
        List<Message>? messages = (conversationItem.messages)
            .map((message) {
          if (message is Map<String, dynamic>) {
            return DataExtractor().extractMessage(message as Map<String, dynamic>);
          } else {
            // Handle invalid message format
            return null;
          }
        })
            .where((message) => message != null).cast<Message>()
            .toList();

        return ProfileChatModel(
          title: conversationItem.title,
          hasRead: true,
          messages: messages,
        );
      }).toList();
      return profileChatModels;
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
      // Return an empty list if the request fails
      return [];
    }
  } catch (error) {
    print('Error: $error');
    // Return an empty list if an error occurs
    return [];
  }
}
