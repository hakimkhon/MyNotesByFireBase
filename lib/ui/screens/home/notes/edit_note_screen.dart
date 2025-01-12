import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/cubit/user/user_cubit.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/model/notes_model.dart';
import 'package:mynotesfire/ui/screens/home/widgets/custom_btn_widget.dart';
import 'package:mynotesfire/ui/screens/widgets/custom_app_bar_widget.dart';

class EditNoteScreen extends StatefulWidget {
  final NotesModel notesModel;
  final int indexNotesModel;     

  const EditNoteScreen({
    super.key,
    required this.notesModel,
    required this.indexNotesModel,
  });

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerSubTitle = TextEditingController();

  @override
  void initState() {
    _controllerTitle.text = widget.notesModel.title;
    _controllerSubTitle.text = widget.notesModel.subTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:
          context.watch<UserCubit>().state.formsStatus != FormsStatus.loading,
      child: Scaffold(
        appBar: const CustomAppBar(title: "Edit Notes", loadingIcon: true),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
          child: Column(
            children: [
              TextFormField(
                controller: _controllerTitle,
                onChanged: (v) => setState(() {}),
                decoration: const InputDecoration(hintText: "Inter title.."),
              ),
              20.verticalSpace,
              // MyTextFormFieldWidget(
              //   hintText: "Inter sub title..",
              //   onChanget: (v) => setState(() {}),
              //   controller: _controllerSubTitle,
              // ),
              30.verticalSpace,
              CustomBtnWidget(
                isLoading: context.watch<UserCubit>().state.formsStatus ==
                    FormsStatus.loading,
                isActiveButton: checkInput,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  context.read<UserCubit>().updateNotes(
                      notesModel: NotesModel(
                        subTitle: _controllerSubTitle.text,
                        title: _controllerTitle.text,
                      ),
                      indexNotesModel: widget.indexNotesModel);
                },
                data: 'Update',
              ),
            ],                                                                                                                                                                                                                                                                                                                                                                                      
          ),
        ),
      ),
    );
  }

  bool get checkInput {
    return _controllerTitle.text.isNotEmpty &&
        _controllerSubTitle.text.isNotEmpty &&
        (_controllerSubTitle.text != widget.notesModel.subTitle ||
            _controllerTitle.text != widget.notesModel.title);
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerSubTitle.dispose();
    super.dispose();
  }
}
