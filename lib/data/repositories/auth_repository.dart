import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotesfire/data/local/storage_repository.dart';
import 'package:mynotesfire/data/model/network_response.dart';
import 'package:mynotesfire/data/model/user_model.dart';
import 'package:mynotesfire/data/utils/extension/app_extension.dart';
import 'package:mynotesfire/ui/core/constant/fixed_names.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FixedNames _fixedNames = FixedNames();

  Future<NetworkResponse> registerUser({
    required String email,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        StorageRepository.setString(key: _fixedNames.userEmail, value: email);
        return await saveUser(email);
      }
    } on FirebaseAuthException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } on FirebaseException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      networkResponse.errorText = "Noma'lum xatolik: catch (e) ";
    }

    return networkResponse;
  }

  Future<NetworkResponse> loginUser({
    required String email,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        StorageRepository.setString(key: _fixedNames.userEmail, value: email);
      }
    } on FirebaseAuthException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } on FirebaseException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      networkResponse.errorText = "Noma'lum xatolik: catch (e) ";
    }

    return networkResponse;
  }

  Future<NetworkResponse> loginAdmin({
    required String phoneNumber,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      var result = await _firebaseFirestore
          .collection(_fixedNames.collectionName)
          .where(_fixedNames.phoneNumber, isEqualTo: "@$phoneNumber")
          .where(_fixedNames.password, isEqualTo: password)
          .get();
      // if (userCredential.user != null) {
      //   StorageRepository.setString(key: _fixedNames.userEmail, value: phoneNumber);
      // }
    } on FirebaseAuthException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } on FirebaseException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      networkResponse.errorText = "Noma'lum xatolik: catch (e) ";
    }

    return networkResponse;
  }

  Future<NetworkResponse> saveUser(String email) async {
    NetworkResponse networkResponse = NetworkResponse();
    UserModel userModel = UserModel.initial();

    try {
      var result = await _firebaseFirestore
          .collection(_fixedNames.collectionName)
          .add(userModel.copyWith(email: email).toJson());

      await _firebaseFirestore
          .collection(_fixedNames.collectionName)
          .doc(result.id)
          .update({
        _fixedNames.docID: result.id
      }); //doc_id bo'lsa yangilaydi yo'q bo'lsa yaratib beradi
    } on FirebaseException catch (e) {
      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      networkResponse.errorText = "Noma'lum xatolik: catch: $e";
    }
    return networkResponse;
  }
}
