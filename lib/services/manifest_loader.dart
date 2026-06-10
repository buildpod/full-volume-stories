import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/cast_manifest_parser.dart';

Future<Map<String, bool>> loadCastManifest() async {
  final jsonString = await rootBundle.loadString('assets/cast_manifest.json');
  final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
  return parseCastManifest(jsonMap);
}
