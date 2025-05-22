import 'package:caretutors/core/utils/firebase_service.dart';
import 'package:caretutors/features/auth/presentation/controllers/auth_controller.dart';
import 'package:caretutors/features/notes/data/note_repository.dart';
import 'package:caretutors/features/notes/domain/note_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  final NoteRepository _noteRepository = NoteRepository(FirebaseService());
  final notes = <Note>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  void fetchNotes() {
    final authController = Get.find<AuthController>();
    final userId = authController.getCurrentUserId();
    if (userId != null) {
      _noteRepository.getNotes(userId).listen((noteMaps) {
        notes.value = noteMaps.map((map) => Note.fromMap(map)).toList();
      });
    }
  }

  Future<void> addNote(String title, String description) async {
    try {
      isLoading.value = true;
      final authController = Get.find<AuthController>();
      final userId = authController.getCurrentUserId();
      if (userId != null) {
        await _noteRepository.addNote(userId, title, description);
        Fluttertoast.showToast(msg: 'Note added successfully');
        Get.back();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to add note: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
