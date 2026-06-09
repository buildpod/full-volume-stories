import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain/models.dart';
import 'state/theme_controller.dart';
import 'services/saved_stories_service.dart';
import 'services/entitlement_service.dart';
import 'services/iap_service.dart';
import 'design/fv_theme.dart';
import 'screens/mode_selector.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final modeString = prefs.getString('app_mode');

  AppMode? initialMode;
  if (modeString != null) {
    initialMode = AppMode.values.firstWhere(
      (e) => e.name == modeString,
      orElse: () => AppMode.neurodivergent,
    );
  }

  final savedStoriesService = SavedStoriesService();
  await savedStoriesService.load();

  final entitlementService = EntitlementService();
  await entitlementService.load();

  final iapService = IapService(entitlementService);
  await iapService.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final controller = ThemeController();
            if (initialMode != null) controller.setMode(initialMode);
            return controller;
          },
        ),
        ChangeNotifierProvider.value(value: savedStoriesService),
        ChangeNotifierProvider.value(value: entitlementService),
        ChangeNotifierProvider.value(value: iapService),
      ],
      child: FullVolumeApp(hasInitialMode: initialMode != null),
    ),
  );
}

class FullVolumeApp extends StatelessWidget {
  final bool hasInitialMode;
  const FullVolumeApp({super.key, required this.hasInitialMode});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    return MaterialApp(
      title: 'Full Volume Stories',
      theme: buildTheme(themeController.mode),
      home: hasInitialMode ? const HomeScreen() : const ModeSelectorScreen(),
    );
  }
}
