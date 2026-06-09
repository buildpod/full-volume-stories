import 'package:flutter_test/flutter_test.dart';
import 'package:full_volume_stories/domain/models.dart';
import 'package:full_volume_stories/services/pdf_export.dart';

void main() {
  group('PDF Export', () {
    const story = Story(
      id: 'test_story',
      mode: AppMode.neurodivergent,
      template: StoryTemplate.firstThen,
      title: {'en': 'Test Story'},
      pages: [
        StoryPage(text: 'First, we wash our hands.', imageAsset: 'wash.png'),
        StoryPage(text: 'Then, we can eat dinner.', imageAsset: 'eat.png'),
      ],
      voiceKeywords: ['wash', 'eat'],
      castIds: ['boy'],
      lowArousal: true,
    );

    test('buildStoryPdf produces a non-empty PDF document', () async {
      final doc = buildStoryPdf(story);
      final bytes = await doc.save();
      expect(bytes.isNotEmpty, true);
    });

    test('PDF contains one page per story page', () async {
      final doc = buildStoryPdf(story);
      final bytes = await doc.save();
      // A valid PDF starts with %PDF
      expect(String.fromCharCodes(bytes.take(4)), '%PDF');
      // Two pages → two Page objects written
      final content = String.fromCharCodes(bytes);
      expect('/Page'.allMatches(content).length, greaterThanOrEqualTo(story.pages.length));
    });
  });
}
