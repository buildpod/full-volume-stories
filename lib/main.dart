import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/models.dart';
import 'state/theme_controller.dart';
import 'design/fv_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: const FullVolumeApp(),
    ),
  );
}

class FullVolumeApp extends StatelessWidget {
  const FullVolumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    return MaterialApp(
      title: 'Full Volume Stories',
      theme: buildTheme(themeController.mode),
      home: const DemoScreen(), // Throwaway demo harness
    );
  }
}

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final isModeA = themeController.mode == AppMode.neurodivergent;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Tokens Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Mode: ${isModeA ? "Neurodivergent (Calm)" : "General (Warm)"}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                themeController.setMode(
                  isModeA ? AppMode.general : AppMode.neurodivergent,
                );
              },
              child: const Text('Toggle Theme Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
