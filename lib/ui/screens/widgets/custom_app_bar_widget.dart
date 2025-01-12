import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool loadingIcon;
  final Widget? widget;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.loadingIcon = false,
    this.widget,
    this.actions,
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
      actions: actions,
      automaticallyImplyLeading: loadingIcon,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
