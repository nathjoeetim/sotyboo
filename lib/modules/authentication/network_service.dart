import '../../models/network_response.dart';
import '../../models/sportboo_user/sportboo_user.dart';
import 'endpoints_constants.dart';
import 'package:dio/dio.dart';

class AuthenticationService {
  SportbooUser? sportbooUser;

  final Dio _dio = Dio(BaseOptions(
    headers: {
      'Content-Type': 'application/json',
    },
    //baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 120),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<NetworkResponse<SportbooUser, ({String userId, String email})>>
      loginWithEmail({required String email, required String password}) async {
    try {
      var response = await _dio.post('$baseUrl/users/auth/login/email',
          data: {'email': email, 'password': password});

      return NetworkResponse<SportbooUser,
              ({String userId, String email})>.success(
          statusCode: response.statusCode ?? 200,
          message: response.data?['message'],
          data: SportbooUser.fromJson(response.data['data']));
    } on DioException catch (e) {
      return NetworkResponse<SportbooUser,
              ({String userId, String email})>.error(
          statusCode: 500,
          message: e.response?.data?['message'] ?? 'Network Error',
          errorData: null);
    } catch (e) {
      return NetworkResponse<SportbooUser,
              ({String userId, String email})>.error(
          statusCode: 500,
          message: 'Network Error: Please try again',
          errorData: null);
    }
  }

  Future<NetworkResponse<dynamic, dynamic>> saveDeviceToken(
      String deviceId, String? authToken) async {
    try {

      var response = await _dio.patch(
        '$baseUrl/profile/device-id',
        data: {'deviceId': deviceId},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      return NetworkResponse<dynamic, dynamic>.success(
          statusCode: response.statusCode ?? 200,
          message: response.data?['message'],
          data: response.data?['data']);
    } on DioException catch (e) {
      return NetworkResponse<dynamic, dynamic>.error(
          statusCode: 500,
          message: 'Network Error: Please try again',
          errorData: null);
    } catch (e) {
      return NetworkResponse<dynamic, dynamic>.error(
          statusCode: 500,
          message: 'Network Error: Please try again',
          errorData: null);
    }
  }
}
