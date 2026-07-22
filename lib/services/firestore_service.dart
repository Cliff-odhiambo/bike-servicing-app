import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../features/authentication/user_model.dart';
import '../features/provider/provider_model.dart';



class FirestoreService {
  FirestoreService._();

  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  /// Save a new user
  static Future<void> saveUser(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toMap());
  }

  static Future<List<ProviderModel>> getPendingProviders() async {
  final snapshot = await _firestore
      .collection('providers')
      .where('approvalStatus', isEqualTo: 'pending')
      .get();

  return snapshot.docs
      .map(
        (doc) => ProviderModel.fromMap(doc.data()),
      )
      .toList();
}

static Future<void> approveProvider(String providerId) async {
  await _firestore
      .collection('providers')
      .doc(providerId)
      .update({
    'approvalStatus': 'approved',
  });
}

static Future<void> rejectProvider(String providerId) async {
  await _firestore
      .collection('providers')
      .doc(providerId)
      .update({
    'approvalStatus': 'rejected',
  });
}

  /// Get the currently logged-in user
  static Future<UserModel?> getCurrentUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      return null;
    }

    return getUserById(firebaseUser.uid);
  }

  /// Get any user by ID
  static Future<UserModel?> getUserById(String uid) async {
    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .get();

    if (!doc.exists) {
      return null;
    }

    return UserModel.fromMap(doc.data()!);
  }

  /// Update an existing user
  static Future<void> updateUser(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .update(user.toMap());
  }

  static Future<void> saveProvider(
  ProviderModel provider,
) async {
  await _firestore
      .collection('providers')
      .doc(provider.id)
      .set(provider.toMap());
}
}
