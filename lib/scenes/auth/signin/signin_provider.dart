import 'package:haikotek_flutter/safety/change_notifier_safety.dart';
import 'package:email_validator/email_validator.dart';

import 'package:haikotek_flutter/utils/app_log.dart';

class SignInProvider extends ChangeNotifierSafety {
  SignInProvider();

  String _emailValue = '';
  bool _emailValid = false;

  String _passwordValue = '';
  bool _obscureText = true;
  bool _formValid = false;

  /// Public properties
  /// 
  /// 

  String get emailValue => _emailValue;

  String get passwordValue => _passwordValue;

  bool get emailValid => _emailValid;

  set emailValid(bool value) {
    _emailValid = value;
    notifyListeners();
  }

  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  bool get formValid => _formValid;

  set formValid(bool value) {
    _formValid = value;
    notifyListeners();
  }

  @override
  void resetState() {
    _emailValue = '';
    _emailValid = false;
    _passwordValue = '';
    _obscureText = true;
    _formValid = false;
    notifyListeners();
  }

  void _validateForm() {
    formValid = emailValid && _passwordValue.isNotEmpty;
  }

  void onEmailChangeToValidateForm(final String email) {
    _emailValue = email;
    _emailValid = EmailValidator.validate(_emailValue);
    _validateForm();
  }

  void onPasswordChangeToValidateForm(final String password) {
    _passwordValue = password;
    _validateForm();
  }
}