import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // For size (30.sp)

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onTap();
      },
      backgroundColor: Colors.indigo, // Custom background color
      elevation: 10.0, // Custom elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.add,
        size: 30.sp, // Custom icon size using ScreenUtil
        color: Colors.black, // Icon color
      ),
    );
  }
}
