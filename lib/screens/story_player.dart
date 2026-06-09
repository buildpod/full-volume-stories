import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../domain/models.dart';
import '../domain/cast_check.dart';
import '../design/tokens.dart';
import '../widgets/parent_gate.dart';
import '../services/pdf_export.dart';

class StoryPlayerScreen extends StatefulWidget {
  final Story story;
  final Map<String, bool> approvedCast;
  final Map<String, CopingCard> copingCards;

  StoryPlayerScreen({
    super.key,
    required this.story,
    required this.approvedCast,
    this.copingCards = const {},
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
    final id = page.copingCardId;
    if (id == null) return;
    final card = widget.copingCards[id];

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: FVTokens.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FVTokens.radiusCard),
        ),
        title: Text(
          card?.title ?? 'Coping Strategy',
          style: const TextStyle(color: FVTokens.ink),
        ),
        content: card == null
            ? const Text('Take a slow breath.', style: TextStyle(color: FVTokens.ink))
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < card.steps.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: FVTokens.xs),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${i + 1}.  ',
                              style: const TextStyle(
                                  color: FVTokens.ink, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Text(card.steps[i],
                                style: const TextStyle(color: FVTokens.ink)),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(FVTokens.aMinTapTarget, FVTokens.aMinTapTarget),
            ),
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close', style: TextStyle(color: FVTokens.ink)),
          ),
        ],
      ),
    );
  }

  Future<void> _showPracticeSummary() async {
    final passed = await showParentGate(context);
    if (!mounted || !passed) return;

    // Resolve the coping strategies this story actually used.
    final usedCardTitles = <String>{};
    for (final page in widget.story.pages) {
      final card = widget.copingCards[page.copingCardId];
      if (card != null) usedCardTitles.add(card.title);
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: FVTokens.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FVTokens.radiusCard),
        ),
        title: const Text('What your child practised', style: TextStyle(color: FVTokens.ink)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.check_circle, color: FVTokens.aPrimary),
                const SizedBox(width: FVTokens.s),
                Expanded(
                  child: Text('Completed: ${widget.story.title['en'] ?? 'Story'}',
                      style: const TextStyle(color: FVTokens.ink)),
                ),
              ],
            ),
            if (widget.story.learningGoal != null) ...[
              const SizedBox(height: FVTokens.m),
              const Text('Skill practised',
                  style: TextStyle(color: FVTokens.ink, fontWeight: FontWeight.bold)),
              const SizedBox(height: FVTokens.xs),
              Text(widget.story.learningGoal!, style: const TextStyle(color: FVTokens.ink)),
            ],
            if (usedCardTitles.isNotEmpty) ...[
              const SizedBox(height: FVTokens.m),
              const Text('Coping strategies used',
                  style: TextStyle(color: FVTokens.ink, fontWeight: FontWeight.bold)),
              const SizedBox(height: FVTokens.xs),
              ...usedCardTitles.map((t) =>
                  Text('• $t', style: const TextStyle(color: FVTokens.ink))),
            ],
          ],
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(FVTokens.aMinTapTarget, FVTokens.aMinTapTarget),
            ),
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Done', style: TextStyle(color: FVTokens.ink)),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf_outlined),
            tooltip: 'Export as PDF',
            onPressed: () async {
              final passed = await showParentGate(context);
              if (!mounted || !passed) return;
              await exportStoryToPdf(widget.story);
            },
          ),
        ],
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
                    if (_currentPageIndex == widget.story.pages.length - 1) ...[
                      const SizedBox(height: FVTokens.s),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          minimumSize: const Size(0, FVTokens.aMinTapTarget),
                        ),
                        onPressed: _showPracticeSummary,
                        icon: const Icon(Icons.flag_outlined, color: FVTokens.ink),
                        label: const Text('Finish', style: TextStyle(color: FVTokens.ink)),
                      ),
                    ],
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
