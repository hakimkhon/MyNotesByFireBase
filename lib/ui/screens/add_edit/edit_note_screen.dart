import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/cubit/user/user_cubit.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/model/notes_model.dart';
import 'package:mynotesfire/ui/screens/widgets/custom_app_bar_widget.dart';
import 'package:mynotesfire/ui/screens/add_edit/widgets/custom_btn_widget.dart';

class EditNoteScreen extends StatefulWidget {
  final NotesModel? notesModel;
  const EditNoteScreen({
    super.key,
    this.notesModel,
  });
  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerSubTitle = TextEditingController();

  @override
  void initState() {
    _controllerTitle.text = widget.notesModel!.title;
    _controllerSubTitle.text = widget.notesModel!.subTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Note',
        loadingIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: Column(
          children: [
            TextFormField(
              onChanged: (v) => setState(() {}),
              controller: _controllerTitle,
            ),
            30.verticalSpace,
            TextFormField(
              onChanged: (v) => setState(() {}),
              controller: _controllerSubTitle,
            ),
            30.verticalSpace,
            CustomBtnWidget(
              data: "Submit",
              isActiveButton: checkInput,
              isLoading: context.watch<UserCubit>().state.formsStatus ==
                  FormsStatus.loading,
              onTap: () {
                FocusScope.of(context).unfocus();
                // context.read<UserCubit>().saveNotes(
                //       notesModel: NotesModel(
                //         title: title,
                //         subTitle: subTitle,
                //       ),
                //     );
              },
            )
          ],
        ),
      ),
    );
  }

  bool get checkInput {
    return _controllerTitle.text.isNotEmpty &&
        _controllerSubTitle.text.isNotEmpty;
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerSubTitle.dispose();
    super.dispose();
  }
}
