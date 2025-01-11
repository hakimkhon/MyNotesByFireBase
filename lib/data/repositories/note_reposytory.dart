import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotesfire/data/model/network_response.dart';
import 'package:mynotesfire/data/model/notes_model.dart';
import 'package:mynotesfire/data/utils/extension/app_extension.dart';
import 'package:mynotesfire/ui/core/constant/fixed_names.dart';

class NoteReposytory {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  

  Future<NetworkResponse> updateNotes({
    required NotesModel notesModel,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      await _firebaseFirestore
          .collection(FixedNames.userNotes)
          .doc()
          .update(notesModel.toJson());
    } on FirebaseException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      networkResponse.errorText = "Noma'lum xatolik: catch: $e";
    }
    return networkResponse;
  }
}
