import 'package:caretutors/core/constants/app_colors.dart';
import 'package:caretutors/features/auth/presentation/controllers/auth_controller.dart';
import 'package:caretutors/features/auth/presentation/controllers/notes_controller.dart';
import 'package:caretutors/features/auth/presentation/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesController notesController = Get.find<NotesController>();
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authController.signOut(),
          ),
        ],
      ),
      body: Obx(() {
        if (notesController.notes.isEmpty) {
          return const Center(child: Text('No notes yet'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: notesController.notes.length,
          itemBuilder:
              (context, index) => NoteCard(note: notesController.notes[index]),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Get.toNamed('/add-note'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
