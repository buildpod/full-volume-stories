import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:full_volume_stories/domain/entitlement.dart';
import 'package:full_volume_stories/services/entitlement_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('isStoryUnlocked (pure)', () {
    test('free sample is always unlocked, even without premium', () {
      expect(isStoryUnlocked(isPremium: false, isFreeSample: true), true);
    });

    test('non-sample story is locked without premium', () {
      expect(isStoryUnlocked(isPremium: false, isFreeSample: false), false);
    });

    test('premium unlocks a non-sample story', () {
      expect(isStoryUnlocked(isPremium: true, isFreeSample: false), true);
    });

    test('premium + free sample is unlocked', () {
      expect(isStoryUnlocked(isPremium: true, isFreeSample: true), true);
    });
  });

  group('EntitlementService', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('defaults to not premium', () async {
      final svc = EntitlementService();
      await svc.load();
      expect(svc.isPremium, false);
    });

    test('setPremium(true) persists across instances', () async {
      final svc1 = EntitlementService();
      await svc1.load();
      await svc1.setPremium(true);

      final svc2 = EntitlementService();
      await svc2.load();
      expect(svc2.isPremium, true);
    });

    test('setPremium notifies listeners only on change', () async {
      final svc = EntitlementService();
      await svc.load();
      int notifications = 0;
      svc.addListener(() => notifications++);

      await svc.setPremium(true);
      await svc.setPremium(true); // no-op, same value
      expect(notifications, 1);
    });
  });
}
