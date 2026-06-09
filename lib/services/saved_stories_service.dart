import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedStoriesService extends ChangeNotifier {
  static const _key = 'saved_story_ids';
  Set<String> _savedIds = {};

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _savedIds = Set.from(prefs.getStringList(_key) ?? []);
    notifyListeners();
  }

  bool isSaved(String storyId) => _savedIds.contains(storyId);

  Future<void> toggleSave(String storyId) async {
    if (_savedIds.contains(storyId)) {
      _savedIds.remove(storyId);
    } else {
      _savedIds.add(storyId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, _savedIds.toList());
    notifyListeners();
  }
}
