import 'package:mynotesfire/ui/core/constant/fixed_names.dart';

class NotesModel {
  final String title;
  final String subTitle;

  NotesModel({
    required this.title,
    required this.subTitle,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) {
   

    return NotesModel(
      title: json[FixedNames.title] as String? ?? "",
      subTitle: json[FixedNames.subTitle] as String? ?? "",
    );
  }
  Map<String, dynamic> toJson() {

    return {
      FixedNames.title: title,
      FixedNames.subTitle: subTitle,
    };
  }
}
