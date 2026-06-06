import 'package:flutter_test/flutter_test.dart';
import 'package:full_volume_stories/design/fv_theme.dart';
import 'package:full_volume_stories/design/tokens.dart';
import 'package:full_volume_stories/domain/models.dart';
import 'dart:io';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  group('Theme Tests', () {
    test('buildTheme(AppMode.neurodivergent) produces a theme whose primary == FVTokens.aPrimary', () {
      final theme = buildTheme(AppMode.neurodivergent);
      expect(theme.colorScheme.primary, FVTokens.aPrimary);
    });

    test('buildTheme(AppMode.general) primary == FVTokens.bPrimary', () {
      final theme = buildTheme(AppMode.general);
      expect(theme.colorScheme.primary, FVTokens.bPrimary);
    });

    test('assert aMaxFocalElements < bMaxFocalElements and aMinTapTarget > bMinTapTarget', () {
      expect(FVTokens.aMaxFocalElements, lessThan(FVTokens.bMaxFocalElements));
      expect(FVTokens.aMinTapTarget, greaterThan(FVTokens.bMinTapTarget));
    });
  });
}
