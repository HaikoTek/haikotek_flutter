import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:haikotek_flutter/models/account.dart';
import 'package:haikotek_flutter/safety/change_notifier_safety.dart';
import 'package:haikotek_flutter/services/api/api_user.dart';

import 'package:haikotek_flutter/services/providers/provider_credential.dart';
import 'package:realm/realm.dart';


class AuthProvider extends ChangeNotifierSafety {
  AuthProvider(this._api, this._credential);

  /// Authentication api
  final ApiUser _api;

  final CredentialProvider _credential;

  @override
  void resetState() {}

  Future<bool> signIn(String email, String password) async {
    final Response<Map<String, dynamic>> result = 
      await _api.signIn(email, password).timeout(const Duration(seconds: 30));

    // ignore: unnecessary_null_comparison
    if (result != null) {
      final token = Token.fromJson(result.data as Map<String, dynamic>);
      if(token.accessToken.isNotEmpty) {
        final userAccount = Account(ObjectId());
        userAccount.emailAddress = email;
        userAccount.password = password;
        await _credential.saveCredential(token, userAccount);
      }

      return false;
    } else {
      throw DioError(
          requestOptions: result.requestOptions,
          error: 'Login error',
          type: DioErrorType.badResponse);
    }
  }
}