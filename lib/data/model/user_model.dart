import 'package:mynotesfire/data/model/notes_model.dart';
import 'package:mynotesfire/ui/core/constant/fixed_names.dart';

class UserModel {
  final String docId;
  final String email;
  final String fullName;
  final List<NotesModel> userNotes;

  UserModel({
    required this.docId,
    required this.email,
    required this.fullName,
    required this.userNotes,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    FixedNames fixedNames = FixedNames();

    return UserModel(
      docId: json[fixedNames.docID] as String? ?? "",
      email: json[fixedNames.userEmail] as String? ?? "",
      fullName: json[fixedNames.fullName] as String? ?? "",
      userNotes: (json[fixedNames.userNotes] as List?)
              ?.map((value) => NotesModel.fromJson(value))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    FixedNames fixedNames = FixedNames();

    return {
      fixedNames.docID: docId,
      fixedNames.userEmail: email,
      fixedNames.fullName: fullName,
      fixedNames.userNotes: userNotes.map((value) => value.toJson()).toList(),
    };
  }

  factory UserModel.initial() {
    return UserModel(
      docId: "",
      email: "",
      fullName: "",
      userNotes: [],
    );
  }

  UserModel copyWith({
    String? docId,
    String? email,
    String? fullName,
    List<NotesModel>? userNotes,
  }) {
    return UserModel(
      docId: docId ?? this.docId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      userNotes: userNotes ?? this.userNotes,
    );
  }
}
