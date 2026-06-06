import 'package:flutter/widgets.dart';
import '../domain/models.dart';

class ThemeController extends ChangeNotifier {
  AppMode _mode = AppMode.neurodivergent;

  AppMode get mode => _mode;

  void setMode(AppMode newMode) {
    if (_mode != newMode) {
      _mode = newMode;
      notifyListeners();
    }
  }
}
