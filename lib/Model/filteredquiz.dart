import 'package:flutter/cupertino.dart';
import 'model.dart';

class Filteredquiz extends ChangeNotifier {
  final List<Quiz> _data = [];

  List<Quiz> get quiz => _data;

  void addquiz(Quiz quiz) {
    _data.add(quiz);
    notifyListeners();
  }

  void clearquiz() {
    _data.clear();
    notifyListeners();
  }
}

class Isselected extends ChangeNotifier {
  final List<String> _data = [];

  List<String> get selected => _data;

  void add(String value) {
    _data.add(value);
    notifyListeners();
  }

  void clear() {
    _data.clear();
    notifyListeners();
  }
}
