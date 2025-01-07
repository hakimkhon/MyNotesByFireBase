import 'package:mynotesfire/ui/core/constant/const_names.dart';

class UserModel {
  final String docId;
  final String email;
  final String fullName;

  UserModel({
    required this.docId,
    required this.email,
    required this.fullName,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    FirestoryDatebase firestory = FirestoryDatebase();
    return UserModel(
      docId: json[firestory.docID] as String? ?? "",
      email: json[firestory.userEmail] as String? ?? "",
      fullName: json[firestory.fullName] as String? ?? "",
    );
  }
  
  Map<String, dynamic> toJson() {
    FirestoryDatebase firestory = FirestoryDatebase();
    return { 
      firestory.docID: docId,
      firestory.userEmail: email,
      firestory.fullName: fullName,
    };
  }

  factory UserModel.initial() {
    return UserModel(
      docId: "",
      email: "",
      fullName: "",
    );
  }

  UserModel copyWith({
    String? docId,
    String? email,
    String? fullName,
  }) {
    return UserModel(
      docId: docId ?? this.docId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
    );
  }

}
