import 'dart:convert';
import 'package:flutter/services.dart';
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
