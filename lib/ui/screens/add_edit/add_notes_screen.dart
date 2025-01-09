import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/cubit/user/user_cubit.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/model/notes_model.dart';
import 'package:mynotesfire/ui/screens/widgets/custom_app_bar_widget.dart';
import 'package:mynotesfire/ui/screens/add_edit/widgets/custom_btn_widget.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  String title = "";
  String subTitle = "";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:
          context.watch<UserCubit>().state.formsStatus != FormsStatus.loading,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Add Note",
          loadingIcon: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Inter title ..."),
                onChanged: (v) => setState(() {
                  title = v;
                }),
              ),
              30.verticalSpace,
              TextFormField(
                decoration:
                    const InputDecoration(hintText: "Inter sub title ..."),
                onChanged: (v) => setState(() {
                  subTitle = v;
                }),
              ),
              30.verticalSpace,
              CustomBtnWidget(
                data: "Submit",
                isActiveButton: checkInput,
                isLoading: context.watch<UserCubit>().state.formsStatus ==
                    FormsStatus.loading,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  context.read<UserCubit>().saveNotes(
                        notesModel: NotesModel(
                          title: title,
                          subTitle: subTitle,
                        ),
                      );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  bool get checkInput {
    return title.isNotEmpty && subTitle.isNotEmpty;
  }
}
