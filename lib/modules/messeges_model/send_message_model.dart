import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sportboo_mobile_client/modules/authentication/endpoints_constants.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class Conversation {
  final String title;
  final String message;

  Conversation({required this.title, required this.message});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      title: json['title'],
      message: json['message'],
    );
  }
}
class ConversationResponse {
  final String message;
  final ConversationData data;

  ConversationResponse({required this.message, required this.data});

  factory ConversationResponse.fromJson(Map<String, dynamic> json) {
    return ConversationResponse(
      message: json['message'],
      data: ConversationData.fromJson(json['data']),
    );
  }
}

class ConversationData {
  final int id;
  final String title;
  final String initiatedBy;
  final int adminId;
  final int userId;
  final String createdAt;

  ConversationData({
    required this.id,
    required this.title,
    required this.initiatedBy,
    required this.adminId,
    required this.userId,
    required this.createdAt,
  });

  factory ConversationData.fromJson(Map<String, dynamic> json) {
    return ConversationData(
      id: json['id'],
      title: json['title'],
      initiatedBy: json['initiatedBy'],
      adminId: json['adminId'],
      userId: json['userId'],
      createdAt: json['createdAt'],
    );
  }
}

class ErrorResponse {
  final String message;
  final String error;
  final int statusCode;

  ErrorResponse({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'] != null ? json['message'] as String : '',
      error: json['error'] != null ? json['error'] as String : '',
      statusCode: json['statusCode'] != null ? json['statusCode'] as int : 0,
    );
  }

}

Future<bool> onSendNewMessage(String title, String message) async {
  showSportbooLoader();
  try {
    // Create a map representing the JSON data
    Map<String, dynamic> jsonData = {
      'title': title,
      'message': message,
    };

    // Convert the map to a JSON string
    String jsonString = jsonEncode(jsonData);

    // Send a POST request to the endpoint with the authorization token
    final response = await http.post(
      Uri.parse('$baseUrl/messages/conversations'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $authToken',
      },
      body: jsonString,
    );

    // Check if the request was successful
    if (response.statusCode >= 200 && response.statusCode < 300) {
      closeSportbooLoader();
      return true; // Message sent successfully
    } else {
      closeSportbooLoader();
      return false; // Message sending failed
    }
  } catch (e) {
    closeSportbooLoader();
    return false; // Message sending failed
  }
}