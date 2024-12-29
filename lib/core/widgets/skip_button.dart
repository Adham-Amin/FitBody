import 'package:fitbody/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    this.onTap, required this.color, required this.title,
  });

  final Color color;
  final String title;
  final VoidCallback? onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: Styles.textNormal14(context).copyWith(color: color),
      ),
    );
  }
}
