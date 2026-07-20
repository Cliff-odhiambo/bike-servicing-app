import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/authentication/user_model.dart';

class FirestoreService {
  FirestoreService._();

  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  static Future<void> saveUser(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toMap());
  }
}