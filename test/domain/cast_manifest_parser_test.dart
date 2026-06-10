import 'package:flutter_test/flutter_test.dart';
import 'package:full_volume_stories/domain/cast_manifest_parser.dart';

void main() {
  group('parseCastManifest', () {
    test('parses approved correctly', () {
      final json = {
        'boy': {'approved': true},
        'fox': {'approved': false},
      };
      final result = parseCastManifest(json);
      expect(result['boy'], isTrue);
      expect(result['fox'], isFalse);
    });

    test('defaults to false when approved field is missing', () {
      final json = {
        'boy': {'notes': 'missing approved field'},
      };
      final result = parseCastManifest(json);
      expect(result['boy'], isFalse);
    });

    test('defaults to false when value is not a map', () {
      final json = {
        'boy': true, // invalid structure
        'fox': 'approved'
      };
      final result = parseCastManifest(json);
      expect(result['boy'], isFalse);
      expect(result['fox'], isFalse);
    });

    test('returns empty map for empty json', () {
      final json = <String, dynamic>{};
      final result = parseCastManifest(json);
      expect(result.isEmpty, isTrue);
    });
  });
}
