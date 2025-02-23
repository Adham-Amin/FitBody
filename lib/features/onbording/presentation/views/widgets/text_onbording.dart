import 'package:fitbody/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextOnbording extends StatelessWidget {
  const TextOnbording({
    super.key,
    required this.title,
    required this.desc,
  });

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 375;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: title,
            child: Text(
              title,
              style: Styles.textBold26(context).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: screenWidth * 12),
          Opacity(
            opacity: 0.70,
            child: Text(
              desc,
              style: Styles.textNormal14(context).copyWith(color: Color(0xffF2F2F2),),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
