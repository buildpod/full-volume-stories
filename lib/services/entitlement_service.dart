import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The non-consumable product that unlocks all stories.
const String kPremiumProductId = 'full_volume_premium';

/// Persisted record of whether the premium unlock has been purchased.
/// The IAP store plumbing (iap_service) is the only thing that should call
/// [setPremium]; the rest of the app reads [isPremium].
class EntitlementService extends ChangeNotifier {
  static const _key = 'premium_unlocked';
  bool _isPremium = false;

  bool get isPremium => _isPremium;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _isPremium = prefs.getBool(_key) ?? false;
    notifyListeners();
  }

  Future<void> setPremium(bool value) async {
    if (_isPremium == value) return;
    _isPremium = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
    notifyListeners();
  }
}
