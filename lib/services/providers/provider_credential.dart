import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haikotek_flutter/safety/change_notifier_safety.dart';

import 'package:realm/realm.dart';
import 'package:haikotek_flutter/models/account.dart';
import 'package:haikotek_flutter/models/credential.dart';

class Token {
  Token({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    tokenType: json['token_type'] as String? ?? '',
    expiresIn: json['expires_in'] as int? ?? -1,
    accessToken: json['access_token'] as String? ?? '',
    refreshToken: json['refresh_token'] as String? ?? '',
  );

  final String tokenType;
  final int expiresIn;
  final String accessToken;
  final String refreshToken;
}

class CredentialProvider extends ChangeNotifierSafety {
  CredentialProvider(this._realm);

  final Realm _realm;

    @override
  void resetState() {}

  Future<bool> loadCredential() async {
    final credentials = _realm.all<Credential>();
    late Credential credential;
    if(credentials.isNotEmpty) {
      credential = credentials.first;
      return true;
    }

    return false;
  }

  Future<bool> saveCredential(final Token? newToken, Account? userAccount) async {
    final userAccounts = _realm.query<Account>('emailAddress == "${userAccount?.emailAddress}"');
    if(userAccounts.isEmpty)  {
      final newUserAccount = Account(ObjectId());
      newUserAccount.emailAddress = userAccount?.emailAddress;
      newUserAccount.password = userAccount?.password;
      _realm.write(() {
        _realm.add(newUserAccount);
      });

      final credential = Credential(ObjectId());
      credential.userId = newUserAccount.id;
      credential.tokenType = newToken?.tokenType;
      credential.expiresIn = newToken?.expiresIn;
      credential.accessToken = newToken?.accessToken;
      credential.refreshToken = newToken?.refreshToken;
      _realm.write(() {
        _realm.add(credential);
      });
      return true;
    } else {
      final userAccount = userAccounts.first;
      final credentials = _realm.query<Credential>('userId == "${userAccount.id}"');
      if(credentials.isNotEmpty) {
        final credential = credentials.first;
        _realm.write(() {
          credential.accessToken = newToken?.accessToken;
          credential.refreshToken = newToken?.refreshToken;
        });

        return true;
      } else {
        final credential = Credential(ObjectId());
        credential.userId = userAccount.id;
        credential.tokenType = newToken?.tokenType;
        credential.expiresIn = newToken?.expiresIn;
        credential.accessToken = newToken?.accessToken;
        credential.refreshToken = newToken?.refreshToken;
        _realm.write(() {
          _realm.add(credential);
        });
        return true;
      }
    }
  }
}