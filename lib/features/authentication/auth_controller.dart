import 'package:firebase_auth/firebase_auth.dart';

import '../../services/firestore_service.dart';
import 'auth_service.dart';
import 'user_model.dart';

class AuthController {
  Future<String?> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    try {
      UserCredential credential = await AuthService.register(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
      );

      UserModel user = UserModel(
        uid: credential.user!.uid,
        fullName: fullName,
        email: email,
        phone: phone,
        role: role,
        createdAt: DateTime.now(),
      );

      await FirestoreService.saveUser(user);

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await AuthService.login(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async {
    await AuthService.logout();
  }
}