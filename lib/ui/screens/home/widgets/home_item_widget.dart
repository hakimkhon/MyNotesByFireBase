import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      child: ZoomTapAnimation(
        onTap: () {},
        child: SizedBox(
          width: double.infinity,
          height: 80.h,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Text(
                "state.userModel.email",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
