import 'package:flutter/material.dart';

class BNBarProvider with ChangeNotifier {
  int _currentIndexScreen = 0;

  int get currentIndexScreen => _currentIndexScreen;

  void changScreen(int index) {
    _currentIndexScreen = index;
    notifyListeners();
  }
}
