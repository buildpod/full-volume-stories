import 'models.dart';

Story? matchStoryByVoice(String transcript, List<Story> stories) {
  final fillerWords = {'the', 'a', 'an', 'i', 'want', 'please', 'can', 'have', 'read', 'me', 'story', 'about'};
  
  // Normalize transcript: lowercase, strip punctuation
  final normalizedTranscript = transcript.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');
  final words = normalizedTranscript.split(RegExp(r'\s+')).where((w) => w.isNotEmpty && !fillerWords.contains(w)).toList();

  if (words.isEmpty) return null;

  Story? bestMatch;
  int maxHits = 0;

  for (final story in stories) {
    int hits = 0;
    // Normalize story keywords
    final keywords = story.voiceKeywords.map((k) => k.toLowerCase()).toList();
    
    for (final word in words) {
      // Partial matching: count if the spoken word contains a keyword or vice versa
      for (final keyword in keywords) {
        if (word.contains(keyword) || keyword.contains(word)) {
          hits++;
          break; // Avoid double counting the same spoken word for multiple keywords
        }
      }
    }

    if (hits > maxHits) {
      maxHits = hits;
      bestMatch = story;
    }
  }

  return bestMatch;
}
