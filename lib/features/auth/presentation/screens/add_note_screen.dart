import 'package:caretutors/core/constants/app_colors.dart';
import 'package:caretutors/features/auth/presentation/controllers/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesController notesController = Get.find<NotesController>();
    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) => value!.isEmpty ? 'Please enter title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter description' : null,
              ),
              const SizedBox(height: 24),
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed:
                      notesController.isLoading.value
                          ? null
                          : () {
                            if (_formKey.currentState!.validate()) {
                              notesController.addNote(
                                _titleController.text.trim(),
                                _descriptionController.text.trim(),
                              );
                            }
                          },
                  child:
                      notesController.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            'Add Note',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
