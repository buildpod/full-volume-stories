import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/models.dart';
import '../state/theme_controller.dart';
import '../design/tokens.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final isModeA = themeController.mode == AppMode.neurodivergent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(FVTokens.m),
        children: [
          Card(
            color: FVTokens.surfaceAlt,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FVTokens.radiusCard),
            ),
            child: ListTile(
              title: const Text('App Mode'),
              subtitle: Text(isModeA ? 'Calm Stories' : 'Story Time'),
              trailing: Switch(
                value: isModeA,
                activeTrackColor: FVTokens.aPrimary,
                onChanged: (val) async {
                  final newMode = val ? AppMode.neurodivergent : AppMode.general;
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('app_mode', newMode.name);
                  themeController.setMode(newMode);
                },
              ),
            ),
          ),
          const SizedBox(height: FVTokens.m),
          // Language placeholder
          Card(
            color: FVTokens.surfaceAlt,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FVTokens.radiusCard),
            ),
            child: ListTile(
              title: const Text('Language'),
              subtitle: const Text('English'),
              trailing: DropdownButton<String>(
                value: 'EN',
                items: const [
                  DropdownMenuItem(value: 'EN', child: Text('English')),
                  DropdownMenuItem(value: 'DE', child: Text('German')),
                  DropdownMenuItem(value: 'HI', child: Text('Hindi')),
                ],
                onChanged: (val) {
                  // Just UI wiring
                },
              ),
            ),
          ),
          const SizedBox(height: FVTokens.m),
          // Text size placeholder
          Card(
            color: FVTokens.surfaceAlt,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FVTokens.radiusCard),
            ),
            child: ListTile(
              title: const Text('Text Size'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {},
                  ),
                  const Text('Standard'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
