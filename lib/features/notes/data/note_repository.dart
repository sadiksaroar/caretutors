import 'package:caretutors/core/utils/firebase_service.dart';
// import 'package:notes_app/core/utils/firebase_service.dart';

class NoteRepository {
  final FirebaseService _firebaseService;

  NoteRepository(this._firebaseService);

  Stream<List<Map<String, dynamic>>> getNotes(String userId) {
    return _firebaseService.getNotes(userId);
  }

  Future<void> addNote(String userId, String title, String description) async {
    await _firebaseService.addNote(userId, title, description);
  }
}
