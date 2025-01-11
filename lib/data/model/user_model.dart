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
    return UserModel(
      docId: json[FixedNames.docID] as String? ?? "",
      email: json[FixedNames.userEmail] as String? ?? "",
      fullName: json[FixedNames.fullName] as String? ?? "",
      userNotes: (json[FixedNames.userNotes] as List?)
              ?.map((value) => NotesModel.fromJson(value))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      FixedNames.docID: docId,
      FixedNames.userEmail: email,
      FixedNames.fullName: fullName,
      FixedNames.userNotes: userNotes.map((value) => value.toJson()).toList(),
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

  Map<String, dynamic> toJsonUserNotes() {
    return {
      FixedNames.userNotes: userNotes.map((value) => value.toJson()).toList(),
    };
  }
}
