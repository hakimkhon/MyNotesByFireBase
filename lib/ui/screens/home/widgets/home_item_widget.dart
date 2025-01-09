import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const HomeItemWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

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
                title,
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
