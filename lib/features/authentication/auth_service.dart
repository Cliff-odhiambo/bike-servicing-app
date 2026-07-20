import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_model.dart';

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
    email: email,
    password: password,
  );


  UserModel user = UserModel(
    uid: credential.user!.uid,
    fullName: fullName,
    email: email,
    phone: phone,
    role: "customer",
    createdAt: DateTime.now(),
  );


  await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .set(
        user.toMap(),
      );


  return credential;
}

  static Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> logout() async {
    await _auth.signOut();
  }

  static User? get currentUser => _auth.currentUser;
}