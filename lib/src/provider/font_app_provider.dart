import 'package:flutter/material.dart';

class FontAppProvider extends ChangeNotifier {
  final List<String> nameFontsList = [
    'RB',
    'JF',
    'Tido',
    'Foda',
    'Arabic',
    'Uthman',
    'QuranFont'
  ];

  String _selectedFont = 'RB';

  String get selectedFont => _selectedFont;

  void changeFont(String nameFont) {
    _selectedFont = nameFont;
    notifyListeners();
  }
}
