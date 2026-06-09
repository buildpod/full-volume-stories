import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/models.dart';
import '../state/theme_controller.dart';
import '../services/entitlement_service.dart';
import '../services/iap_service.dart';
import '../design/tokens.dart';
import 'paywall.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final isModeA = themeController.mode == AppMode.neurodivergent;
    final isPremium = context.watch<EntitlementService>().isPremium;
    final iap = context.read<IapService>();

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
          // Premium / purchases
          Card(
            color: FVTokens.surfaceAlt,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FVTokens.radiusCard),
            ),
            child: ListTile(
              title: const Text('Full Library'),
              subtitle: Text(isPremium ? 'Unlocked' : 'Locked'),
              trailing: isPremium
                  ? const Icon(Icons.check_circle, color: FVTokens.aPrimary)
                  : TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const PaywallScreen()),
                      ),
                      child: const Text('Unlock', style: TextStyle(color: FVTokens.ink)),
                    ),
            ),
          ),
          const SizedBox(height: FVTokens.m),
          Card(
            color: FVTokens.surfaceAlt,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FVTokens.radiusCard),
            ),
            child: ListTile(
              title: const Text('Restore Purchases'),
              trailing: const Icon(Icons.restore),
              onTap: () => iap.restorePurchases(),
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
