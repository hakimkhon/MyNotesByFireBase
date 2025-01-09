import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/cubit/user/user_cubit.dart';
import 'package:mynotesfire/cubit/user/user_state.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/routes/app_routes.dart';
import 'package:mynotesfire/data/service/navigation_service.dart';
import 'package:mynotesfire/ui/screens/home/widgets/custom_app_bar.dart';
import 'package:mynotesfire/ui/screens/home/widgets/home_item_widget.dart';

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
      appBar: const CustomAppBar(title: "All Notes"),
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return HomeItemWidget(
                  onTap: () {},
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationService.instance
              .navigateMyScreen(routeName: AppRoutesNames.add);
        }, // A different icon
        backgroundColor: Colors.green, // Custom background color
        elevation: 10.0, // Custom elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.add,
          size: 30.sp,
          color: Colors.black,
        ), // Custom shape
      ),
    );
  }
}
