import 'package:haikotek_flutter/safety/change_notifier_safety.dart';

class HomeProvider extends ChangeNotifierSafety {
  HomeProvider();

  int _counter = 0;

  int get counter => _counter;

  void increase() {
    _counter ++;
    notifyListeners();
  }

  @override
  void resetState() {
    _counter = 0;
    notifyListeners();
  }
}