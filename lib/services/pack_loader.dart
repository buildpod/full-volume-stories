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

Future<List<StoryPack>> loadAllPacks(Map<String, bool> castApproval) async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
  
  final packPaths = manifestMap.keys
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
