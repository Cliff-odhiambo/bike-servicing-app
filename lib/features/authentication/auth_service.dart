import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  AuthService._();

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    UserCredential credential =
        await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    return credential;
  }

  static Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  static Future<void> logout() async {
    await _auth.signOut();
  }

  static Future<void> resetPassword({
    required String email,
  }) async {
    await _auth.sendPasswordResetEmail(
      email: email.trim(),
    );
  }

  static Future<String?> getUserRole() async {
  final user = _auth.currentUser;

  if (user == null) {
    return null;
  }

  final doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .get();

  if (!doc.exists) {
    return null;
  }

  final data = doc.data();

  return data?['role'] as String?;
}

  static User? get currentUser => _auth.currentUser;

}