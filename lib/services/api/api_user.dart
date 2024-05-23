import 'package:dio/dio.dart';

import 'api.dart';

class ApiUser extends Api {
  /// Sign in
  Future<Response<Map<String, dynamic>>> signIn(String email, String password) async {
    final Options options = await getOptions();
    /// OAuth 2.0
    final data = FormData.fromMap({
      'username': email,
      'password': password,
      'grant_type': 'grant_type',
      'client_secret': 'client_secret!',
      'client_id': 'client_id'
    });
    return wrapE(() => dio.post<Map<String, dynamic>>(
      '$apiBaseUrl/$apiSignIn', 
      options: options, 
      data: data));
  }
}