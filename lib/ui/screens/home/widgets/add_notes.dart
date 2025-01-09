import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/ui/screens/home/widgets/custom_app_bar.dart';
import 'package:mynotesfire/ui/screens/home/widgets/custom_btn_widget.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerSubTitle = TextEditingController();
 
  String title = "";
  String subTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Note"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Inter title ..."),
            controller: _controllerTitle,
            ),
            30.verticalSpace,
            TextFormField(
              decoration: const InputDecoration(hintText: "Inter sub title ..."),
              controller: _controllerSubTitle,
            ),
            30.verticalSpace,
            const CustomBtnWidget(data: "Add")
          ],
        ),
      ),
    );
  }
}
