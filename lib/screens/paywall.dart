import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../design/tokens.dart';
import '../services/entitlement_service.dart';
import '../services/iap_service.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iap = context.watch<IapService>();
    final isPremium = context.watch<EntitlementService>().isPremium;
    final price = iap.priceLabel;

    return Scaffold(
      backgroundColor: FVTokens.surface,
      appBar: AppBar(title: const Text('Unlock All Stories')),
      body: Padding(
        padding: const EdgeInsets.all(FVTokens.l),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_stories, size: 96, color: FVTokens.ink),
            const SizedBox(height: FVTokens.l),
            Text(
              isPremium ? 'All stories unlocked' : 'Unlock the full library',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: FVTokens.ink,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: FVTokens.m),
            const Text(
              'One purchase unlocks every story in both Calm and Story Time '
              'modes — no ads, no subscriptions.',
              style: TextStyle(color: FVTokens.ink),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: FVTokens.xl),
            if (isPremium)
              const Text(
                'Thank you for your support!',
                style: TextStyle(color: FVTokens.ink, fontWeight: FontWeight.bold),
              )
            else if (!iap.isStoreAvailable)
              const Text(
                'The store is unavailable right now. Please try again later.',
                style: TextStyle(color: FVTokens.ink),
                textAlign: TextAlign.center,
              )
            else ...[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, FVTokens.aMinTapTarget),
                ),
                onPressed: iap.premiumProduct == null ? null : () => iap.buyPremium(),
                child: Text(price.isEmpty ? 'Unlock' : 'Unlock for $price'),
              ),
              const SizedBox(height: FVTokens.m),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, FVTokens.aMinTapTarget),
                ),
                onPressed: () => iap.restorePurchases(),
                child: const Text(
                  'Restore Purchases',
                  style: TextStyle(color: FVTokens.ink),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
