import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strive_yourself/src/models/adhkar_model.dart';

class AdhkarProvider with ChangeNotifier {
  List<AdhkarModel> _adhkar = [];
  List<AdhkarModel> get adhkar => _adhkar;

  Future<void> loadAdhkar(String nameFileAdhkarJson) async {
    try {
      final String response = await rootBundle
          .loadString('assets/db/adhkar/$nameFileAdhkarJson.json');

      final List<dynamic> data = json.decode(response);

      _adhkar = data.map((json) => AdhkarModel.fromJson(json)).toList();
    } catch (e) {
      // ignore: avoid_print
      print("Error Loading 0-0 :$e");
    }
    notifyListeners();
  }

  void decreaseCount(String id) {
    final index = _adhkar.indexWhere((adhkar) => adhkar.id == id);
    if (index != -1 && _adhkar[index].remainingCount > 0) {
      _adhkar[index].remainingCount--;
      notifyListeners();
    }
  }

  Future<void> copyDhkar(String dhkar) async {
    await Clipboard.setData(ClipboardData(text: dhkar)); 
    notifyListeners(); 
  }
}
