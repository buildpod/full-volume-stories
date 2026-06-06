import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../domain/models.dart';
import '../domain/cast_check.dart';
import '../design/tokens.dart';

class StoryPlayerScreen extends StatefulWidget {
  final Story story;
  final Map<String, bool> approvedCast;

  StoryPlayerScreen({
    super.key,
    required this.story,
    required this.approvedCast,
  }) {
    // Safety gate: ensure cast is approved before allowing screen to be built
    validateStoryCast(story, approvedCast);
  }

  @override
  State<StoryPlayerScreen> createState() => _StoryPlayerScreenState();
}

class _StoryPlayerScreenState extends State<StoryPlayerScreen> {
  int _currentPageIndex = 0;
  final FlutterTts _tts = FlutterTts();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await _tts.setLanguage("en-US");
    _tts.setCompletionHandler(() {
      if (mounted) {
        setState(() => _isPlaying = false);
      }
    });
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _playText(String text) async {
    await _tts.stop();
    setState(() => _isPlaying = true);
    await _tts.speak(text);
  }

  Future<void> _stopText() async {
    await _tts.stop();
    setState(() => _isPlaying = false);
  }

  void _nextPage() {
    if (_currentPageIndex < widget.story.pages.length - 1) {
      _stopText();
      setState(() => _currentPageIndex++);
    }
  }

  void _prevPage() {
    if (_currentPageIndex > 0) {
      _stopText();
      setState(() => _currentPageIndex--);
    }
  }

  void _showCopingCard() {
    final page = widget.story.pages[_currentPageIndex];
    if (page.copingCardId == null) return;
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Coping Strategy', style: TextStyle(color: FVTokens.ink)),
        content: Text('Card ID: ${page.copingCardId}', style: const TextStyle(color: FVTokens.ink)),
        backgroundColor: FVTokens.surface,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close', style: TextStyle(color: FVTokens.ink)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final page = widget.story.pages[_currentPageIndex];
    final isModeA = widget.story.lowArousal;

    Widget imageWidget = Image.asset(
      page.imageAsset,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: FVTokens.surfaceAlt,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(FVTokens.l),
          child: const Text(
            'Illustration pending review',
            style: TextStyle(color: FVTokens.ink, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: FVTokens.surface,
      appBar: AppBar(
        title: Text(widget.story.title['en'] ?? 'Story'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _stopText();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(FVTokens.m),
                child: isModeA
                    ? Container(
                        child: imageWidget,
                      )
                    : AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: KeyedSubtree(
                          key: ValueKey<String>(page.imageAsset),
                          child: imageWidget,
                        ),
                      ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(FVTokens.l),
                color: isModeA ? FVTokens.aCalm : FVTokens.bGlow,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          page.text,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: FVTokens.ink,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 48,
                          constraints: BoxConstraints(
                            minWidth: isModeA ? FVTokens.aMinTapTarget : FVTokens.bMinTapTarget,
                            minHeight: isModeA ? FVTokens.aMinTapTarget : FVTokens.bMinTapTarget,
                          ),
                          icon: const Icon(Icons.arrow_back),
                          onPressed: _currentPageIndex > 0 ? _prevPage : null,
                        ),
                        const SizedBox(width: FVTokens.m),
                        IconButton(
                          iconSize: 48,
                          constraints: BoxConstraints(
                            minWidth: isModeA ? FVTokens.aMinTapTarget : FVTokens.bMinTapTarget,
                            minHeight: isModeA ? FVTokens.aMinTapTarget : FVTokens.bMinTapTarget,
                          ),
                          icon: Icon(_isPlaying ? Icons.stop_circle : Icons.play_circle),
                          onPressed: () {
                            if (_isPlaying) {
                              _stopText();
                            } else {
                              _playText(page.text);
                            }
                          },
                        ),
                        const SizedBox(width: FVTokens.m),
                        IconButton(
                          iconSize: 48,
                          constraints: BoxConstraints(
                            minWidth: isModeA ? FVTokens.aMinTapTarget : FVTokens.bMinTapTarget,
                            minHeight: isModeA ? FVTokens.aMinTapTarget : FVTokens.bMinTapTarget,
                          ),
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: _currentPageIndex < widget.story.pages.length - 1 ? _nextPage : null,
                        ),
                        if (isModeA && page.copingCardId != null) ...[
                          const SizedBox(width: FVTokens.m),
                          IconButton(
                            iconSize: 48,
                            constraints: BoxConstraints(
                              minWidth: isModeA ? FVTokens.aMinTapTarget : FVTokens.bMinTapTarget,
                              minHeight: isModeA ? FVTokens.aMinTapTarget : FVTokens.bMinTapTarget,
                            ),
                            icon: const Icon(Icons.favorite),
                            onPressed: _showCopingCard,
                          ),
                        ]
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
