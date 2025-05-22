import 'package:caretutors/features/auth/presentation/screens/add_note_screen.dart';
import 'package:caretutors/features/auth/presentation/screens/home_screen.dart';
import 'package:caretutors/features/auth/presentation/screens/login_screen.dart';
import 'package:caretutors/features/auth/presentation/screens/register_screen.dart';
import 'package:caretutors/features/auth/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => const LoginScreen()),
    GetPage(name: '/register', page: () => const RegisterScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/add-note', page: () => const AddNoteScreen()),
  ];
}
