import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '../domain/models.dart';
import '../domain/cast_check.dart';

Future<StoryPack> loadPack(String assetPath, Map<String, bool> castApproval) async {
  final jsonString = await rootBundle.loadString(assetPath);
  final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
  final pack = StoryPack.fromJson(jsonMap);

  for (final story in pack.stories) {
    validateStoryCast(story, castApproval);
  }

  return pack;
}

Future<List<String>> _bundledAssetPaths() async {
  final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  return manifest.listAssets();
}

Future<List<StoryPack>> loadAllPacks(
  Map<String, bool> castApproval, {
  Future<List<String>> Function() listAssetPaths = _bundledAssetPaths,
}) async {
  final packPaths = (await listAssetPaths())
      .where((path) => path.startsWith('assets/packs/') && path.endsWith('.json'))
      .toList();
      
  // Ensure sample_neuro.json is first
  packPaths.sort((a, b) {
    if (a.endsWith('sample_neuro.json')) return -1;
    if (b.endsWith('sample_neuro.json')) return 1;
    return a.compareTo(b);
  });
  
  final List<StoryPack> loadedPacks = [];
  for (final path in packPaths) {
    try {
      final pack = await loadPack(path, castApproval);
      loadedPacks.add(pack);
    } on CastNotApprovedException catch (e) {
      debugPrint('Skipping pack $path: $e');
    } catch (e) {
      debugPrint('Error loading pack $path: $e');
    }
  }
  
  return loadedPacks;
}

String? freeSampleIdForMode(List<StoryPack> packs, AppMode mode) {
  for (final pack in packs) {
    if (pack.mode == mode && pack.stories.isNotEmpty) {
      return pack.stories.first.id;
    }
  }
  return null;
}
