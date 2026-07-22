import 'package:firebase_auth/firebase_auth.dart';

import '../../services/firestore_service.dart';
import 'provider_model.dart';

class ProviderController {
  Future<String?> registerProvider({
    required String shopName,
    required String businessPhone,
    required String location,
    required String experience,
  }) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return "No logged in user.";
      }

      final provider = ProviderModel(
        id: currentUser.uid,
        ownerId: currentUser.uid,
        shopName: shopName,
        businessPhone: businessPhone,
        location: location,
        experience: experience,
        approvalStatus: "pending",
        rating: 0,
        totalJobs: 0,
        createdAt: DateTime.now(),
      );

      await FirestoreService.saveProvider(provider);

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<ProviderModel>> getPendingProviders() async {
    return await FirestoreService.getPendingProviders();
  }

  Future<void> approveProvider(String providerId) async {
    await FirestoreService.approveProvider(providerId);
  }

  Future<void> rejectProvider(String providerId) async {
    await FirestoreService.rejectProvider(providerId);
  }
}