import 'package:mynotesfire/ui/core/constant/fixed_names.dart';

class NotesModel {
  final String title;
  final String subTitle;

  NotesModel({
    required this.title,
    required this.subTitle,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    FixedNames fixedNames = FixedNames();

    return NotesModel(
      title: json[fixedNames.title] as String? ?? "",
      subTitle: json[fixedNames.subTitle] as String? ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    FixedNames fixedNames = FixedNames();

    return {
      fixedNames.title: title,
      fixedNames.subTitle: subTitle,
    };
  }
}
