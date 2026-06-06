import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:full_volume_stories/screens/mode_selector.dart';
import 'package:full_volume_stories/widgets/parent_gate.dart';
import 'package:full_volume_stories/state/theme_controller.dart';
import 'dart:io';

class _MyHttpOverrides extends HttpOverrides {}

void main() {
  setUpAll(() {
    HttpOverrides.global = _MyHttpOverrides();
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Mode Selector renders two cards', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => ThemeController(),
          child: const ModeSelectorScreen(),
        ),
      ),
    );

    expect(find.text('Calm Stories'), findsOneWidget);
    expect(find.text('Story Time'), findsOneWidget);
  });

  testWidgets('Parent Gate blocks until passed', (WidgetTester tester) async {
    bool? gateResult;
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                gateResult = await showParentGate(context);
              },
              child: const Text('Show Gate'),
            ),
          ),
        ),
      ),
    );

    // Tap to show gate
    await tester.tap(find.text('Show Gate'));
    await tester.pumpAndSettle();

    expect(find.text('What is 7 + 5?'), findsOneWidget);

    // Enter wrong answer
    await tester.enterText(find.byType(TextField), '10');
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    // Gate is still showing
    expect(find.text('What is 7 + 5?'), findsOneWidget);
    expect(gateResult, isNull);

    // Enter correct answer
    await tester.enterText(find.byType(TextField), '12');
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    // Gate is closed and returned true
    expect(find.text('What is 7 + 5?'), findsNothing);
    expect(gateResult, isTrue);
  });
}
