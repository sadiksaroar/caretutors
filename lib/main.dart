import 'package:caretutors/core/routes/app_router.dart';
import 'package:caretutors/features/auth/presentation/controllers/auth_controller.dart';
import 'package:caretutors/features/auth/presentation/controllers/notes_controller.dart';
import 'package:caretutors/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  Get.put(NotesController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: AppRouter.routes,
      initialRoute: '/splash',
    );
  }
}
