import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/data/model/notes_model.dart';
import 'package:mynotesfire/data/routes/app_routes.dart';
import 'package:mynotesfire/data/service/navigation_service.dart';
import 'package:mynotesfire/ui/screens/widgets/custom_app_bar_widget.dart';

class DetailNoteScreen extends StatelessWidget {
  final NotesModel notesModel;
  final int myIndex;

  const DetailNoteScreen({
    super.key,
    required this.notesModel,
    required this.myIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Detail Note",
        loadingIcon: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
              size: 22.sp,
            ),
            onPressed: () {
              debugPrint("\n+++++++++++++++++++++\n");
              NavigationService.instance.navigateMyScreen(
                  routeName: AppRoutesNames.edit,
                  arguments: {
                    "model": notesModel,
                    "index": myIndex,
                  });
            },
          )
        ],
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
            // 30.verticalSpace,
            // Row(
            //   children: [
            //     CustomBtnWidget(data: "Update", onTap: () {}),
            //     const Spacer(),
            //     CustomBtnWidget(data: "Delete", onTap: () {}),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
