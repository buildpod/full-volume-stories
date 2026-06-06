import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/models.dart';
import '../state/theme_controller.dart';
import '../design/tokens.dart';
import '../widgets/parent_gate.dart';
import 'settings.dart';

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
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(FVTokens.l),
                decoration: BoxDecoration(
                  color: FVTokens.surfaceAlt,
                  borderRadius: BorderRadius.circular(FVTokens.radiusCard),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.auto_stories,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: FVTokens.m),
                    Text(
                      'Coming Soon',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: FVTokens.ink,
                      ),
                    ),
                    const SizedBox(height: FVTokens.s),
                    Text(
                      'Story packs will appear here.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: FVTokens.ink,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
