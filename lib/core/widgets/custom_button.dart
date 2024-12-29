import 'package:fitbody/constants.dart';
import 'package:fitbody/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.screenWidth,
    this.onTap,
    required this.title, required this.screenHeight,
  });

  final double screenHeight;
  final double screenWidth;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 295,
        decoration: BoxDecoration(
          color: kPrimeColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 16),
        child: Text(
          title,
          style: Styles.textMedium18(context).copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
