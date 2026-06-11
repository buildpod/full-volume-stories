import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:full_volume_stories/services/pack_loader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Pack Loader Tests', () {
    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMessageHandler('flutter/assets', (ByteData? message) async {
        final String key = utf8.decode(message!.buffer.asUint8List());
        if (key == 'AssetManifest.json') {
          return ByteData.view(utf8.encoder.convert('{"assets/packs/sample_neuro.json": ["assets/packs/sample_neuro.json"], "assets/packs/test_pack.json": ["assets/packs/test_pack.json"]}').buffer);
        } else if (key == 'assets/packs/sample_neuro.json') {
          return ByteData.view(utf8.encoder.convert('{"id": "sample", "sku": "free", "mode": "neurodivergent", "stories": [{"id": "s1", "mode": "neurodivergent", "template": "firstThen", "title": {"en": "Sample"}, "voiceKeywords": [], "castIds": ["boy"], "lowArousal": true, "pages": []}], "copingCards": {}}').buffer);
        } else if (key == 'assets/packs/test_pack.json') {
          return ByteData.view(utf8.encoder.convert('{"id": "test", "sku": "premium", "mode": "general", "stories": [{"id": "s2", "mode": "general", "template": "narrative", "title": {"en": "Test"}, "voiceKeywords": [], "castIds": ["lion"], "lowArousal": false, "pages": []}], "copingCards": {}}').buffer);
        }
        return null;
      });
    });

    test('loadAllPacks loads valid packs and skips unapproved ones', () async {
      // Approve boy, reject lion
      final approvedCast = {'boy': true, 'lion': false};
      
      final packs = await loadAllPacks(approvedCast);
      
      expect(packs.length, 1);
      expect(packs.first.stories.first.id, 's1');
    });
    
    test('loadAllPacks sorts sample_neuro.json to the front', () async {
      final approvedCast = {'boy': true, 'lion': true};
      
      final packs = await loadAllPacks(approvedCast);
      
      expect(packs.length, 2);
      expect(packs.first.stories.first.id, 's1');
      expect(packs[1].stories.first.id, 's2');
    });

    test('freeSampleIdForMode returns correct free sample per mode', () async {
      final approvedCast = {'boy': true, 'lion': true};
      final packs = await loadAllPacks(approvedCast);
      
      // Packs: [Mode A pack (s1), Mode B pack (s2)]
      expect(packs.first.mode.name, 'neurodivergent');
      expect(packs[1].mode.name, 'general');

      // Given Mode A pack first and Mode B pack second:
      final modeAFreeSample = freeSampleIdForMode(packs, packs.first.mode);
      final modeBFreeSample = freeSampleIdForMode(packs, packs[1].mode);

      expect(modeAFreeSample, 's1');
      expect(modeBFreeSample, 's2');
    });
  });
}
