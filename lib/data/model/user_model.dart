import 'package:mynotesfire/ui/core/constant/fixed_names.dart';

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
    FixedNames fixedNames = FixedNames();
    return UserModel(
      docId: json[fixedNames.docID] as String? ?? "",
      email: json[fixedNames.userEmail] as String? ?? "",
      fullName: json[fixedNames.fullName] as String? ?? "",
    );
  }
  
  Map<String, dynamic> toJson() {
    FixedNames fixedNames = FixedNames();
    return { 
      fixedNames.docID: docId,
      fixedNames.userEmail: email,
      fixedNames.fullName: fullName,
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
