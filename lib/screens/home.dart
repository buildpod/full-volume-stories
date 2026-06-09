import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/models.dart';
import '../domain/voice_match.dart';
import '../state/theme_controller.dart';
import '../services/saved_stories_service.dart';
import '../services/entitlement_service.dart';
import '../domain/entitlement.dart';
import '../design/tokens.dart';
import '../widgets/parent_gate.dart';
import '../services/pack_loader.dart';
import '../services/voice_service.dart';
import 'settings.dart';
import 'story_player.dart';
import 'paywall.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<StoryPack>? _packFuture;
  final VoiceService _voiceService = VoiceService();
  bool _showSavedOnly = false;

  @override
  void initState() {
    super.initState();
    // Temporary hardcoded test approval map until cast_manifest.json exists
    _packFuture = loadPack('assets/packs/sample_neuro.json', const {'boy': true});
    _voiceService.initialize();
    _voiceService.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _voiceService.dispose();
    super.dispose();
  }

  void _openStory(BuildContext context, Story story, StoryPack pack) {
    final freeSampleId = pack.stories.isNotEmpty ? pack.stories.first.id : null;
    final entitlement = Provider.of<EntitlementService>(context, listen: false);
    final unlocked = isStoryUnlocked(
      isPremium: entitlement.isPremium,
      isFreeSample: story.id == freeSampleId,
    );
    if (!unlocked) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const PaywallScreen()),
      );
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => StoryPlayerScreen(
          story: story,
          approvedCast: const {'boy': true},
        ),
      ),
    );
  }

  Future<void> _handleMicTap() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    
    bool consent = prefs.getBool('mic_consent_granted') ?? false;

    if (!consent) {
      final passed = await showParentGate(context);
      if (!mounted || !passed) return;

      final result = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: FVTokens.surface,
          title: const Text('Enable Voice Search?', style: TextStyle(color: FVTokens.ink)),
          content: const Text(
            'The microphone listens to find a story. Speech is sent to your device\'s speech recognizer to convert to text. No audio is ever saved or shared.',
            style: TextStyle(color: FVTokens.ink),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('No Thanks', style: TextStyle(color: FVTokens.ink)),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('Allow', style: TextStyle(color: FVTokens.ink)),
            ),
          ],
        ),
      );

      if (result == true) {
        await prefs.setBool('mic_consent_granted', true);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Voice is off. Enable in settings or tap mic again to allow.')),
        );
        return;
      }
    }

    if (_voiceService.isListening) {
      await _voiceService.stopListening();
      return;
    }

    final pack = await _packFuture;
    if (!mounted || pack == null) return;

    await _voiceService.startListening(
      onResult: (transcript) {
        if (!mounted) return;
        final match = matchStoryByVoice(transcript, pack.stories);
        if (match != null) {
          _openStory(context, match, pack);
        } else {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: FVTokens.surface,
              title: const Text('I didn\'t catch that', style: TextStyle(color: FVTokens.ink)),
              content: const Text('Try one of these:', style: TextStyle(color: FVTokens.ink)),
              actions: pack.stories.map((s) => TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _openStory(context, s, pack);
                },
                child: Text(s.title['en'] ?? 'Story', style: const TextStyle(color: FVTokens.ink)),
              )).toList()..add(
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Cancel', style: TextStyle(color: FVTokens.ink)),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mode = context.watch<ThemeController>().mode;
    final modeName = mode == AppMode.neurodivergent ? 'Calm Stories' : 'Story Time';

    return Scaffold(
      appBar: AppBar(
        title: Text(modeName),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              final currentContext = context;
              final passed = await showParentGate(currentContext);
              if (!currentContext.mounted) return;
              if (passed) {
                Navigator.of(currentContext).push(
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header controls
          Padding(
            padding: const EdgeInsets.all(FVTokens.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: 'EN',
                  items: const [
                    DropdownMenuItem(value: 'EN', child: Text('EN')),
                    DropdownMenuItem(value: 'DE', child: Text('DE')),
                    DropdownMenuItem(value: 'HI', child: Text('HI')),
                  ],
                  onChanged: (val) {
                    // Wired to state only, no content
                  },
                ),
                Row(
                  children: [
                    if (_voiceService.isListening)
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text('Listening...', style: TextStyle(color: FVTokens.ink, fontStyle: FontStyle.italic)),
                      ),
                    IconButton(
                      icon: Icon(_voiceService.isListening ? Icons.mic_off : Icons.mic),
                      color: _voiceService.isListening ? Colors.red : null,
                      style: IconButton.styleFrom(
                        minimumSize: const Size(FVTokens.aMinTapTarget, FVTokens.aMinTapTarget),
                      ),
                      onPressed: _handleMicTap,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Packs list
          Expanded(
            child: FutureBuilder<StoryPack>(
              future: _packFuture,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: FVTokens.ink)));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final pack = snapshot.data!;
                final freeSampleId =
                    pack.stories.isNotEmpty ? pack.stories.first.id : null;
                return Consumer2<SavedStoriesService, EntitlementService>(
                  builder: (context, savedService, entitlement, _) {
                    final stories = _showSavedOnly
                        ? pack.stories.where((s) => savedService.isSaved(s.id)).toList()
                        : pack.stories;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: FVTokens.m,
                            vertical: FVTokens.xs,
                          ),
                          child: Row(
                            children: [
                              FilterChip(
                                label: const Text('All'),
                                selected: !_showSavedOnly,
                                onSelected: (_) => setState(() => _showSavedOnly = false),
                              ),
                              const SizedBox(width: FVTokens.s),
                              FilterChip(
                                label: const Text('Saved'),
                                selected: _showSavedOnly,
                                onSelected: (_) => setState(() => _showSavedOnly = true),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: stories.isEmpty
                              ? Center(
                                  child: Text(
                                    _showSavedOnly
                                        ? 'No saved stories yet.\nTap ♥ on any story to save it.'
                                        : 'No stories found.',
                                    style: const TextStyle(color: FVTokens.ink),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : ListView.builder(
                                  padding: const EdgeInsets.all(FVTokens.m),
                                  itemCount: stories.length,
                                  itemBuilder: (context, index) {
                                    final story = stories[index];
                                    final isSaved = savedService.isSaved(story.id);
                                    final unlocked = isStoryUnlocked(
                                      isPremium: entitlement.isPremium,
                                      isFreeSample: story.id == freeSampleId,
                                    );
                                    return Card(
                                      color: FVTokens.surfaceAlt,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(FVTokens.radiusCard),
                                      ),
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.all(FVTokens.m),
                                        leading: Icon(
                                          unlocked ? Icons.menu_book : Icons.lock_outline,
                                          size: 48,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                        title: Text(story.title['en'] ?? 'Story'),
                                        subtitle: Text(unlocked ? 'Tap to read' : 'Tap to unlock'),
                                        trailing: IconButton(
                                          icon: Icon(
                                            isSaved ? Icons.favorite : Icons.favorite_border,
                                            color: isSaved ? Colors.red : FVTokens.ink,
                                          ),
                                          onPressed: () => savedService.toggleSave(story.id),
                                        ),
                                        onTap: () {
                                          if (!unlocked) {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => const PaywallScreen(),
                                              ),
                                            );
                                            return;
                                          }
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => StoryPlayerScreen(
                                                story: story,
                                                approvedCast: const {'boy': true},
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
