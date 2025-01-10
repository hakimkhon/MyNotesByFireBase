import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/data/model/notes_model.dart';
import 'package:mynotesfire/ui/screens/home/custom_btn_widget.dart';
import 'package:mynotesfire/ui/screens/widgets/custom_app_bar_widget.dart';

class DetailNoteScreen extends StatelessWidget {
  final NotesModel notesModel;

  const DetailNoteScreen({super.key, required this.notesModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Detail Note",
        loadingIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Title: ",
                  style: TextStyle(fontSize: 18.sp, color: Colors.black),
                ),
                Text(
                  notesModel.title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                Text(
                  "Sub title: ",
                  style: TextStyle(fontSize: 18.sp, color: Colors.black),
                ),
                Text(
                  notesModel.subTitle,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Row(
              children: [
                CustomBtnWidget(data: "Update", onTap: () {}),
                const Spacer(),
                CustomBtnWidget(data: "Delete", onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
