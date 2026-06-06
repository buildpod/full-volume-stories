import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/models.dart';
import '../state/theme_controller.dart';
import '../design/tokens.dart';
import '../widgets/parent_gate.dart';
import '../services/pack_loader.dart';
import 'settings.dart';
import 'story_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              final passed = await showParentGate(context);
              if (passed && context.mounted) {
                Navigator.of(context).push(
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
                IconButton(
                  icon: const Icon(Icons.mic),
                  style: IconButton.styleFrom(
                    minimumSize: const Size(FVTokens.aMinTapTarget, FVTokens.aMinTapTarget),
                  ),
                  onPressed: () {
                    // Visual only
                  },
                ),
              ],
            ),
          ),
          // Packs list
          Expanded(
            child: FutureBuilder<StoryPack>(
              // Temporary hardcoded test approval map until cast_manifest.json exists in FV-asset task
              future: loadPack('assets/packs/sample_neuro.json', const {'boy': true}),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: FVTokens.ink)));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final pack = snapshot.data!;
                return ListView.builder(
                  padding: const EdgeInsets.all(FVTokens.m),
                  itemCount: pack.stories.length,
                  itemBuilder: (context, index) {
                    final story = pack.stories[index];
                    return Card(
                      color: FVTokens.surfaceAlt,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(FVTokens.radiusCard),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(FVTokens.m),
                        leading: Icon(
                          Icons.menu_book,
                          size: 48,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(story.title['en'] ?? 'Story'),
                        subtitle: const Text('Tap to read'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => StoryPlayerScreen(
                                story: story,
                                // Temporary hardcoded test approval map
                                approvedCast: const {'boy': true},
                              ),
                            ),
                          );
                        },
                      ),
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
