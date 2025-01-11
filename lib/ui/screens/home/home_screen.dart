import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/cubit/user/user_cubit.dart';
import 'package:mynotesfire/cubit/user/user_state.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/routes/app_routes.dart';
import 'package:mynotesfire/data/service/navigation_service.dart';
import 'package:mynotesfire/ui/screens/home/widgets/home_item_widget.dart';
import 'package:mynotesfire/ui/screens/widgets/custom_app_bar_widget.dart';
import 'package:mynotesfire/ui/screens/home/widgets/custom_fab_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // context.read<UserCubit>().fetchUser();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<UserCubit>().fetchUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Notes App"),
      body: BlocConsumer<UserCubit, UserState>(
        builder: (BuildContext context, UserState state) {
          if (state.formsStatus == FormsStatus.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.userModel.userNotes.isEmpty) {
            return Center(
              child: Text(
                "Empty Notes",
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: state.userModel.userNotes.length,
            itemBuilder: (context, index) {
              return HomeItemWidget(
                onTap: () {
                  NavigationService.instance.navigateMyScreen(
                    routeName: AppRoutesNames.detail,
                    arguments: {"model": state.userModel.userNotes[index], "index": index},
                  );
                },
                // onTap: () {
                //   NavigationService.instance.navigateMyScreen(
                //     routeName: AppRoutesNames.edit,
                //     arguments: [state.userModel.userNotes[index], index],
                //   );
                // },
                title: state.userModel.userNotes[index].title,
              );
            },
          );
        },
        listener: (BuildContext context, state) {
          if (state.statusMessage == "pop") {
            Navigator.pop(context);
          }
        },
      ),
      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
          NavigationService.instance
              .navigateMyScreen(routeName: AppRoutesNames.add);
        },
      ),
    );
  }
}
