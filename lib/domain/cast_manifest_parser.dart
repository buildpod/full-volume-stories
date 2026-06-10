Map<String, bool> parseCastManifest(Map<String, dynamic> json) {
  final result = <String, bool>{};
  for (final entry in json.entries) {
    final castId = entry.key;
    final data = entry.value;
    if (data is Map<String, dynamic>) {
      final approved = data['approved'];
      result[castId] = approved == true;
    } else {
      result[castId] = false;
    }
  }
  return result;
}
