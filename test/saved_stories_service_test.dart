import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:full_volume_stories/services/saved_stories_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SavedStoriesService', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('starts empty', () async {
      final svc = SavedStoriesService();
      await svc.load();
      expect(svc.isSaved('story_001'), false);
    });

    test('toggleSave adds a story', () async {
      final svc = SavedStoriesService();
      await svc.load();
      await svc.toggleSave('story_001');
      expect(svc.isSaved('story_001'), true);
    });

    test('toggleSave twice removes the story', () async {
      final svc = SavedStoriesService();
      await svc.load();
      await svc.toggleSave('story_001');
      await svc.toggleSave('story_001');
      expect(svc.isSaved('story_001'), false);
    });

    test('persists across service instances', () async {
      final svc1 = SavedStoriesService();
      await svc1.load();
      await svc1.toggleSave('story_002');

      final svc2 = SavedStoriesService();
      await svc2.load();
      expect(svc2.isSaved('story_002'), true);
    });

    test('multiple stories can be saved independently', () async {
      final svc = SavedStoriesService();
      await svc.load();
      await svc.toggleSave('story_001');
      await svc.toggleSave('story_003');
      expect(svc.isSaved('story_001'), true);
      expect(svc.isSaved('story_002'), false);
      expect(svc.isSaved('story_003'), true);
    });
  });
}
