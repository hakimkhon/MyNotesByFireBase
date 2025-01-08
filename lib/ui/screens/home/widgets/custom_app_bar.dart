import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/data/routes/app_routes.dart';
import 'package:mynotesfire/data/service/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    // this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () {
            NavigationService.instance.navigateMyScreenAndRemoveUntil(
              routeName: AppRoutesNames.signup,
            );
          },
        ),
      ],
      automaticallyImplyLeading: false,
      // backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
