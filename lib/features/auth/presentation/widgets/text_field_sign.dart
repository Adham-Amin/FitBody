import 'package:fitbody/constants.dart';
import 'package:fitbody/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFieldSign extends StatelessWidget {
  const TextFieldSign({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.hintText,
    this.suffixIcon,
    this.onSaved,
    this.keyboardType, this.obscureText = false,
  });

  final Function(String?)? onSaved;
  final double screenWidth;
  final double screenHeight;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Field can\'t be empty' : null,
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      style: Styles.textLight16(context),
      decoration: InputDecoration(
        border: _buildOutlineInputBorder(Colors.white),
      enabledBorder: _buildOutlineInputBorder(Colors.white),
      focusedBorder: _buildOutlineInputBorder(kPrimeColor, width: 2),
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: Styles.textLight16(context),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 24,
          vertical: screenHeight * 16,
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }

}