import 'package:flutter_test/flutter_test.dart';
import 'package:full_volume_stories/domain/models.dart';
import 'package:full_volume_stories/domain/cast_check.dart';
import 'package:full_volume_stories/services/pack_loader.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Domain and Loader Tests', () {
    const samplePackPath = 'assets/packs/sample_neuro.json';

    test('Valid pack with {"boy":true} loads and returns 1 story', () async {
      final pack = await loadPack(samplePackPath, {"boy": true});
      expect(pack.stories.length, 1);
      expect(pack.stories.first.castIds, contains("boy"));
    });

    test('Same pack with {"boy":false} throws CastNotApprovedException', () async {
      expect(
        () async => await loadPack(samplePackPath, {"boy": false}),
        throwsA(isA<CastNotApprovedException>()),
      );
    });

    test('Pack referencing ["sister"] with sister absent from approval map throws', () async {
      final jsonString = await rootBundle.loadString(samplePackPath);
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      
      // Modify JSON to have a different cast ID to test this scenario
      jsonMap['stories'][0]['castIds'] = ['sister'];
      final pack = StoryPack.fromJson(jsonMap);

      expect(
        () => validateStoryCast(pack.stories.first, {"boy": true}), // sister is absent
        throwsA(isA<CastNotApprovedException>()),
      );
    });

    test('Story.fromJson round-trips all fields', () {
      final json = {
        "id": "story_001",
        "mode": "neurodivergent",
        "template": "firstThen",
        "title": {"en": "First Wash Hands, Then Eat"},
        "pages": [
          {
            "text": "First, we wash our hands.",
            "imageAsset": "wash_hands.png",
            "copingCardId": null
          }
        ],
        "voiceKeywords": ["wash", "eat"],
        "castIds": ["boy"],
        "lowArousal": true
      };

      final story = Story.fromJson(json);

      expect(story.id, "story_001");
      expect(story.mode, AppMode.neurodivergent);
      expect(story.template, StoryTemplate.firstThen);
      expect(story.title["en"], "First Wash Hands, Then Eat");
      expect(story.pages.length, 1);
      expect(story.pages.first.text, "First, we wash our hands.");
      expect(story.pages.first.imageAsset, "wash_hands.png");
      expect(story.pages.first.copingCardId, null);
      expect(story.voiceKeywords, ["wash", "eat"]);
      expect(story.castIds, ["boy"]);
      expect(story.lowArousal, true);
    });
  });
}
