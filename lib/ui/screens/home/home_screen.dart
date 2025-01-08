import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/cubit/user/user_cubit.dart';
import 'package:mynotesfire/cubit/user/user_state.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/routes/app_routes.dart';
import 'package:mynotesfire/data/service/navigation_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserCubit>().fetchUser();
    // Future.microtask(() {
    //   context.read<UserCubit>().fetchUser();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Notes with Firebase",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              NavigationService.instance.navigateMyScreenAndRemoveUntil(
                routeName: AppRoutesNames.signup,
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.sp,
            )),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserCubit, UserState>(
                builder: (BuildContext context, UserState state) {
              if (state.formsStatus == FormsStatus.loading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              return Center(
                child: Text(
                  state.userModel.fullName,
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
