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
    try {//users/auth/login/email

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
          message: 'Network Error: Please try again',
          errorData: null);
    }
  }
}
