import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Icon? icon;
  const Inputfield({
    this.controller,
    Key? key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.icon, // Use the constructor parameter directly
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Mymediaquery().mediaquerywidth(0.02, context),
          right: Mymediaquery().mediaquerywidth(0.02, context)),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          fillColor: Myappallcolor().textcolor,
          filled: true,
          labelText: label,
          hintText: hinttext,
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
