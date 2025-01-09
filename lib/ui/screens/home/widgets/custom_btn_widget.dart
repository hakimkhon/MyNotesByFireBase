import 'package:flutter/material.dart';

class CustomBtnWidget extends StatelessWidget {
  const CustomBtnWidget({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        backgroundColor: Colors.blue,
      ),
      onPressed: () {},
      child: Text(
        data,
      ),
    );
  }
}
