import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/models.dart';
import '../state/theme_controller.dart';
import '../design/tokens.dart';
import 'home.dart';

class ModeSelectorScreen extends StatelessWidget {
  const ModeSelectorScreen({super.key});

  Future<void> _selectMode(BuildContext context, AppMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_mode', mode.name);
    
    if (context.mounted) {
      context.read<ThemeController>().setMode(mode);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FVTokens.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(FVTokens.l),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: FVTokens.ink,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: FVTokens.xl),
              // Card A - Neurodivergent
              _ModeCard(
                title: 'Calm Stories',
                subtitle: 'Low stimulation, predictable flow',
                backgroundColor: FVTokens.aCalm,
                primaryColor: FVTokens.aPrimary,
                onTap: () => _selectMode(context, AppMode.neurodivergent),
              ),
              const SizedBox(height: FVTokens.l),
              // Card B - General
              _ModeCard(
                title: 'Story Time',
                subtitle: 'Engaging, warm narratives',
                backgroundColor: FVTokens.bGlow,
                primaryColor: FVTokens.bPrimary,
                onTap: () => _selectMode(context, AppMode.general),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color primaryColor;
  final VoidCallback onTap;

  const _ModeCard({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.primaryColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(FVTokens.radiusCard),
      child: Container(
        constraints: const BoxConstraints(minHeight: FVTokens.aMinTapTarget),
        padding: const EdgeInsets.all(FVTokens.l),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(FVTokens.radiusCard),
          border: Border.all(color: primaryColor, width: 2),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: FVTokens.ink,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: FVTokens.s),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: FVTokens.ink,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
