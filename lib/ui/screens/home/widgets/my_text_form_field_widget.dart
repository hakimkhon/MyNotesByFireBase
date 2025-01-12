import 'package:flutter/material.dart';

class MyTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final Function? onChanget;
  final TextEditingController? controller;

  const MyTextFormFieldWidget({
    super.key,
    required this.hintText,
   this.onChanget,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      controller: controller,
      onChanged: onChanget!(),
    );
  }
}
