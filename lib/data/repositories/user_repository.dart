import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotesfire/data/local/storage_repository.dart';
import 'package:mynotesfire/data/model/network_response.dart';
import 'package:mynotesfire/data/model/user_model.dart';
import 'package:mynotesfire/data/utils/extension/app_extension.dart';
import 'package:mynotesfire/ui/core/constant/fixed_names.dart';

class UserRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FixedNames _fixedNames = FixedNames();

  Future<NetworkResponse> getUser() async {
    NetworkResponse networkResponse = NetworkResponse();
    String userEmail = StorageRepository.getString(key: _fixedNames.userEmail);

    try {
      var result = await _firebaseFirestore
          .collection(_fixedNames.collectionName)
          .where(_fixedNames.userEmail, isEqualTo: userEmail)
          .get();

      List<UserModel> userModel =
          result.docs.map((value) => UserModel.fromJson(value.data())).toList();

      if (userModel.isNotEmpty) {
        networkResponse.data = userModel.first;
      } else {
        networkResponse.errorText = _fixedNames.notFound;
      }
    } on FirebaseException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      networkResponse.errorText = "Noma'lum xatolik: catch: $e";
    }
    return networkResponse;
  }

  Future<NetworkResponse> getUserForDocId({required String docId}) async {
    NetworkResponse networkResponse = NetworkResponse();
  
    try {
      var result = await _firebaseFirestore
          .collection(_fixedNames.collectionName)
          .doc(docId)
          .get();

      if (result.data() != null) {
        UserModel.fromJson(result.data()!);
      } else {
        networkResponse.errorText = _fixedNames.notFound;
      }
    } on FirebaseException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      networkResponse.errorText = "Noma'lum xatolik: catch: $e";
    }
    return networkResponse;
  }

  Future<NetworkResponse> updateUserNotes({
    required UserModel userModel,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      await _firebaseFirestore
          .collection(_fixedNames.collectionName)
          .doc(userModel.docId)
          .update(userModel.toJsonUserNotes());
    } on FirebaseException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      networkResponse.errorText = "Noma'lum xatolik: catch: $e";
    }
    return networkResponse;
  }
}
