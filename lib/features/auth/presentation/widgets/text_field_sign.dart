import 'package:fitbody/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFieldSign extends StatelessWidget {
  const TextFieldSign({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.hintText,
    this.suffixIcon,
    required this.keyboardType,
    this.onSavevd,
  });

  final void Function(String?)? onSavevd;
  final TextInputType keyboardType;
  final double screenWidth;
  final double screenHeight;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Enter your $hintText' : null,
      onSaved: onSavevd,
      cursorColor: Colors.black,
      style: Styles.textLight16(context).copyWith(color: Colors.black),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: outlineBorder(),
        enabledBorder: outlineBorder(),
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: Styles.textLight16(context).copyWith(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 24,
          vertical: screenHeight * 16,
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    );
  }
}
