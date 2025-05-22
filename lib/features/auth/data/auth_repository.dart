import 'package:caretutors/core/utils/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseService _firebaseService;

  AuthRepository(this._firebaseService);

  Future<void> signIn(String email, String password) async {
    await _firebaseService.signIn(email, password);
  }

  Future<void> signUp(String email, String password, String name) async {
    await _firebaseService.signUp(email, password, name);
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }

  User? getCurrentUser() => _firebaseService.getCurrentUser();
}
