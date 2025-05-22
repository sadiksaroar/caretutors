import 'package:caretutors/core/utils/firebase_service.dart';
import 'package:caretutors/features/auth/data/auth_repository.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository(FirebaseService());
  var isLoading = false.obs;

  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      await _authRepository.signIn(email, password);
      Get.offAllNamed('/home');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Login failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    try {
      isLoading.value = true;
      await _authRepository.signUp(email, password, name);
      Get.offAllNamed('/home');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Registration failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    Get.offAllNamed('/login');
  }

  bool isLoggedIn() => _authRepository.getCurrentUser() != null;

  String? getCurrentUserId() => _authRepository.getCurrentUser()?.uid;
}
