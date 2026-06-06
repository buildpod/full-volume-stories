import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:full_volume_stories/screens/story_player.dart';
import 'package:full_volume_stories/domain/models.dart';
import 'package:full_volume_stories/domain/cast_check.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class _MyHttpOverrides extends HttpOverrides {}

void main() {
  setUpAll(() {
    HttpOverrides.global = _MyHttpOverrides();
  });

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter_tts'), (MethodCall methodCall) async {
      return 1;
    });
  });

  final dummyStory = Story(
    id: 's1',
    mode: AppMode.neurodivergent,
    template: StoryTemplate.narrative,
    title: const {'en': 'Test Story'},
    pages: const [
      StoryPage(text: 'Page 1 text', imageAsset: 'missing1.png'),
      StoryPage(text: 'Page 2 text', imageAsset: 'missing2.png', copingCardId: 'c1'),
    ],
    voiceKeywords: const [],
    castIds: const ['boy'],
    lowArousal: true,
  );

  testWidgets('A story that passed loadPack renders its first page text', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: StoryPlayerScreen(
        story: dummyStory,
        approvedCast: const {'boy': true},
      ),
    ));

    expect(find.text('Page 1 text'), findsOneWidget);
  });

  testWidgets('Next/previous navigation changes the page', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: StoryPlayerScreen(
        story: dummyStory,
        approvedCast: const {'boy': true},
      ),
    ));

    expect(find.text('Page 1 text'), findsOneWidget);
    
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    expect(find.text('Page 2 text'), findsOneWidget);
    
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('Page 1 text'), findsOneWidget);
  });

  testWidgets('A Story with an unapproved castId is refused by the player entry guard', (tester) async {
    expect(() => StoryPlayerScreen(
        story: dummyStory,
        approvedCast: const {'boy': false}, // Refused
      ), throwsA(isA<CastNotApprovedException>()));
  });

  testWidgets('Mode A story has autoplay disabled', (tester) async {
    // There is no autoplay behavior since it's button-triggered. 
    // We just verify it builds and doesn't auto-advance or crash.
    await tester.pumpWidget(MaterialApp(
      home: StoryPlayerScreen(
        story: dummyStory,
        approvedCast: const {'boy': true},
      ),
    ));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    // Should still be on page 1
    expect(find.text('Page 1 text'), findsOneWidget);
  });
}
