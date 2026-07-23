import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../features/authentication/user_model.dart';
import '../features/provider/provider_model.dart';
import '../features/requests/request_model.dart';




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

/// Save a new service request
static Future<void> saveRequest(
  RequestModel request,
) async {
  await _firestore
      .collection('requests')
      .doc(request.id)
      .set(request.toMap());
}

/// Get all pending requests
static Future<List<RequestModel>> getPendingRequests() async {
  final snapshot = await _firestore
      .collection('requests')
      .where('status', isEqualTo: 'pending')
      .orderBy('createdAt', descending: true)
      .get();

  return snapshot.docs
      .map(
        (doc) => RequestModel.fromMap(doc.data()),
      )
      .toList();
}

/// Provider accepts a request
static Future<void> acceptRequest(
  String requestId,
  String providerId,
) async {
  await _firestore
      .collection('requests')
      .doc(requestId)
      .update({
    'providerId': providerId,
    'status': 'accepted',
    'acceptedAt': DateTime.now().toIso8601String(),
  });
}

/// Reject a request
static Future<void> rejectRequest(
  String requestId,
) async {
  await _firestore
      .collection('requests')
      .doc(requestId)
      .update({
    'status': 'rejected',
  });
}

/// Get the latest request for the current rider
static Future<RequestModel?> getLatestRequest(
  String riderId,
) async {
  final snapshot = await _firestore
      .collection('requests')
      .where('riderId', isEqualTo: riderId)
      .orderBy('createdAt', descending: true)
      .limit(1)
      .get();

  if (snapshot.docs.isEmpty) {
    return null;
  }

  return RequestModel.fromMap(
    snapshot.docs.first.data(),
  );
}

/// Get all requests belonging to a rider
static Future<List<RequestModel>> getRiderRequests(
  String riderId,
) async {
  final snapshot = await _firestore
      .collection('requests')
      .where('riderId', isEqualTo: riderId)
      .orderBy('createdAt', descending: true)
      .get();

  return snapshot.docs
      .map(
        (doc) => RequestModel.fromMap(doc.data()),
      )
      .toList();
}

/// Get a single request by its ID
static Future<RequestModel?> getRequestById(
  String requestId,
) async {
  final doc = await _firestore
      .collection('requests')
      .doc(requestId)
      .get();

  if (!doc.exists) {
    return null;
  }

  return RequestModel.fromMap(doc.data()!);
}

/// Mark request as completed
static Future<void> completeRequest(
  String requestId,
) async {
  await _firestore
      .collection('requests')
      .doc(requestId)
      .update({
    'status': 'completed',
    'completedAt': DateTime.now().toIso8601String(),
  });
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

static Future<void> logout() async {
  await FirebaseAuth.instance.signOut();
}


}
