import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'entitlement_service.dart';

/// Thin wrapper over [InAppPurchase]. Translates store events into
/// entitlement changes. Kept deliberately small because it touches native
/// platform channels and is exercised via manual/store testing, not unit
/// tests — the testable access logic lives in domain/entitlement.dart.
class IapService extends ChangeNotifier {
  final InAppPurchase _iap = InAppPurchase.instance;
  final EntitlementService _entitlement;

  StreamSubscription<List<PurchaseDetails>>? _sub;
  ProductDetails? _premiumProduct;
  bool _available = false;

  IapService(this._entitlement);

  bool get isStoreAvailable => _available;
  ProductDetails? get premiumProduct => _premiumProduct;
  String get priceLabel => _premiumProduct?.price ?? '';

  Future<void> initialize() async {
    if (kIsWeb) {
      _available = false;
      notifyListeners();
      return;
    }
    
    try {
      _available = await _iap.isAvailable();
    } catch (e) {
      _available = false;
    }
    
    if (!_available) {
      notifyListeners();
      return;
    }

    _sub = _iap.purchaseStream.listen(
      _onPurchaseUpdate,
      onError: (_) {},
    );

    final response = await _iap.queryProductDetails({kPremiumProductId});
    if (response.productDetails.isNotEmpty) {
      _premiumProduct = response.productDetails.first;
    }
    notifyListeners();
  }

  Future<void> buyPremium() async {
    final product = _premiumProduct;
    if (product == null) return;
    await _iap.buyNonConsumable(
      purchaseParam: PurchaseParam(productDetails: product),
    );
  }

  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  Future<void> _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (final purchase in purchases) {
      if (purchase.productID != kPremiumProductId) continue;

      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        await _entitlement.setPremium(true);
      }

      if (purchase.pendingCompletePurchase) {
        await _iap.completePurchase(purchase);
      }
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
