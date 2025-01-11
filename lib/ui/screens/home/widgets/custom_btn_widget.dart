import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtnWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String data;
  final bool isActiveButton;
  final bool isLoading;

  const CustomBtnWidget({
    super.key,
    required this.data,
    required this.onTap,
    this.isActiveButton = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        backgroundColor: isActiveButton ? Colors.blue : Colors.grey,
      ),
      onPressed: () {
        isActiveButton ? onTap() : null;
        debugPrint("$data bosildi ++++++++++++++++");
      },
      child: isLoading
          ? const CircularProgressIndicator.adaptive()
          : Text(
              data,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
    );
  }
}
