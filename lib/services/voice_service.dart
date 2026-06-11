import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart';

// PRIVACY RULE (NFR-3):
// We do NOT persist or log audio or transcripts anywhere.
// The transcript is used entirely in-memory for keyword matching,
// and then immediately discarded.
class VoiceService extends ChangeNotifier {
  final SpeechToText _speech = SpeechToText();
  bool _isListening = false;
  
  bool get isListening => _isListening;

  Future<bool> initialize() async {
    return await _speech.initialize(
      onError: (val) {
        _isListening = false;
        notifyListeners();
      },
      onStatus: (val) {
        if (val == 'done' || val == 'notListening') {
          _isListening = false;
          notifyListeners();
        }
      },
    );
  }

  Future<void> startListening({required Function(String) onResult}) async {
    if (!_speech.isAvailable) return;
    _isListening = true;
    notifyListeners();
    
    await _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          _isListening = false;
          notifyListeners();
          onResult(result.recognizedWords);
        }
      },
    );
  }

  Future<void> stopListening() async {
    await _speech.stop();
    _isListening = false;
    notifyListeners();
  }
}
