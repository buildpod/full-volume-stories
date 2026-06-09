import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:full_volume_stories/domain/models.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CopingCard model', () {
    test('CopingCard.fromJson parses id, title and steps', () {
      final card = CopingCard.fromJson({
        'id': 'card_breathe',
        'title': 'Take a calm breath',
        'steps': ['Breathe in.', 'Breathe out.'],
      });
      expect(card.id, 'card_breathe');
      expect(card.title, 'Take a calm breath');
      expect(card.steps, ['Breathe in.', 'Breathe out.']);
    });

    test('StoryPack defaults to empty copingCards when absent', () {
      final pack = StoryPack.fromJson({
        'id': 'p',
        'mode': 'neurodivergent',
        'sku': 's',
        'stories': [],
      });
      expect(pack.copingCards, isEmpty);
    });

    test('Story.learningGoal is null when absent', () {
      final story = Story.fromJson({
        'id': 's1',
        'mode': 'neurodivergent',
        'template': 'firstThen',
        'title': {'en': 'T'},
        'pages': [
          {'text': 'p', 'imageAsset': 'a.png', 'copingCardId': null}
        ],
        'voiceKeywords': <String>[],
        'castIds': ['boy'],
        'lowArousal': true,
      });
      expect(story.learningGoal, isNull);
    });
  });

  group('sample_neuro.json content', () {
    test('declares card_breathe with steps and a learning goal', () async {
      final jsonString =
          await rootBundle.loadString('assets/packs/sample_neuro.json');
      final pack = StoryPack.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);

      expect(pack.copingCards.containsKey('card_breathe'), true);
      expect(pack.copingCards['card_breathe']!.steps, isNotEmpty);
      expect(pack.stories.first.learningGoal, isNotNull);
      // The first page references the coping card by id.
      expect(pack.stories.first.pages.first.copingCardId, 'card_breathe');
    });
  });
}
