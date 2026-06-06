import 'package:flutter_test/flutter_test.dart';
import 'package:full_volume_stories/domain/models.dart';
import 'package:full_volume_stories/domain/voice_match.dart';

void main() {
  final story1 = Story(
    id: 's1',
    mode: AppMode.neurodivergent,
    template: StoryTemplate.narrative,
    title: const {'en': 'The Potty Story'},
    pages: const [],
    voiceKeywords: const ['potty', 'toilet'],
    castIds: const ['boy'],
    lowArousal: true,
  );

  final story2 = Story(
    id: 's2',
    mode: AppMode.neurodivergent,
    template: StoryTemplate.narrative,
    title: const {'en': 'Brushing Teeth'},
    pages: const [],
    voiceKeywords: const ['brush', 'teeth', 'toothbrush'],
    castIds: const ['boy'],
    lowArousal: true,
  );

  final stories = [story1, story2];

  test('A transcript containing a story\'s keyword returns that story', () {
    final match = matchStoryByVoice('I want the potty story', stories);
    expect(match?.id, 's1');
  });

  test('Filler-only transcript ("I want the please") returns null', () {
    final match = matchStoryByVoice('I want the please', stories);
    expect(match, isNull);
  });

  test('Transcript with no keyword match returns null', () {
    final match = matchStoryByVoice('Lets play with toys', stories);
    expect(match, isNull);
  });

  test('Normalization works: "POTTY!!!" matches keyword "potty"', () {
    final match = matchStoryByVoice('POTTY!!!', stories);
    expect(match?.id, 's1');
  });

  test('When two stories partially match, the one with more keyword hits wins', () {
    final story3 = Story(
      id: 's3',
      mode: AppMode.neurodivergent,
      template: StoryTemplate.narrative,
      title: const {'en': 'Potty and Brush'},
      pages: const [],
      voiceKeywords: const ['potty', 'brush', 'teeth'],
      castIds: const ['boy'],
      lowArousal: true,
    );
    final match = matchStoryByVoice('potty brush teeth', [story1, story3]);
    // s1 has 1 hit (potty). s3 has 3 hits (potty, brush, teeth)
    expect(match?.id, 's3');
  });
}
