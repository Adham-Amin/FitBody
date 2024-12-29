import 'package:fitbody/constants.dart';
import 'package:fitbody/core/utils/app_router.dart';
import 'package:fitbody/core/utils/styles.dart';
import 'package:fitbody/core/widgets/custom_button.dart';
import 'package:fitbody/core/widgets/skip_button.dart';
import 'package:fitbody/features/auth/presentation/widgets/gender_select.dart';
import 'package:fitbody/features/auth/presentation/widgets/text_field_sign.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width / 375;
    final screenHeight = MediaQuery.of(context).size.height / 812;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 24),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 152 * screenHeight,),
            Text(
              'Join us to start searching',
              style: Styles.textMedium24(context).copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8 * screenHeight,
            ),
            Text(
              'You can search c ourse, apply course and find scholarship for abroad studies',
              style: Styles.textNormal14(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24 * screenHeight,
            ),
            TextFieldSign(
              keyboardType: TextInputType.name,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              hintText: 'Name',
            ),
            SizedBox(
              height: 12 * screenHeight,
            ),
            TextFieldSign(
              keyboardType: TextInputType.emailAddress,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              hintText: 'Email',
            ),
            SizedBox(
              height: 12 * screenHeight,
            ),
            TextFieldSign(
              keyboardType: TextInputType.visiblePassword,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.visibility_off,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              height: 12 * screenHeight,
            ),
            TextFieldSign(
              keyboardType: TextInputType.number,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              hintText: 'Age',
            ),
            SizedBox(
              height: 22 * screenHeight,
            ),
            GenderSelection(),
            SizedBox(
              height: 80 * screenHeight,
            ),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.homeView);
              },
              screenWidth: screenWidth,
              title: 'Sign up',
              screenHeight: screenHeight,
            ),
            SizedBox(
              height: 12 * screenHeight,
            ),
            SkipButton(
              color: kPrimeColor,
              title: 'Have an account? Log in',
              onTap: () {
                GoRouter.of(context).push(AppRouter.loginView);
              },
            ),
          ],
        ),
      ),
    );
  }
}