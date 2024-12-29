import 'package:fitbody/core/utils/app_router.dart';
import 'package:fitbody/core/utils/styles.dart';
import 'package:fitbody/core/widgets/custom_button.dart';
import 'package:fitbody/features/auth/presentation/widgets/text_field_sign.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DigitsCode extends StatelessWidget {
  const DigitsCode({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width / 375;
    final screenHeight = MediaQuery.of(context).size.height / 812;

    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 24,
          right: screenWidth * 24,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: screenHeight * 20,
            ),
            Divider(
              thickness: 5,
              endIndent: 120,
              indent: 120,
            ),
            SizedBox(
              height: screenHeight * 56,
            ),
            Text(
              'Enter 4 Digits Code',
              style: Styles.textMedium24(context)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 12 * screenHeight,
            ),
            Text(
              'Enter the 4 digits code that you received on your email.',
              style: Styles.textNormal14(context),
            ),
            SizedBox(
              height: 36 * screenHeight,
            ),
            TextFieldSign(
              keyboardType: TextInputType.number,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              hintText: 'Code',
            ),
            SizedBox(
              height: 32 * screenHeight,
            ),
            Center(
              child: CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.homeView);
                },
                screenWidth: screenWidth,
                title: 'Continue',
                screenHeight: screenHeight,
              ),
            ),
            SizedBox(
              height: 52 * screenHeight,
            ),
          ],
        ),
      ),
    );
  }
}