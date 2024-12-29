import 'package:fitbody/constants.dart';
import 'package:fitbody/core/utils/app_router.dart';
import 'package:fitbody/core/utils/styles.dart';
import 'package:fitbody/core/widgets/custom_button.dart';
import 'package:fitbody/core/widgets/skip_button.dart';
import 'package:fitbody/features/auth/presentation/widgets/forgot_password.dart';
import 'package:fitbody/features/auth/presentation/widgets/text_field_sign.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
            SizedBox(
              height: 152 * screenHeight,
            ),
            Text(
              'Welcome back',
              style: Styles.textMedium24(context)
                  .copyWith(fontWeight: FontWeight.w600),
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
              height: 112 * screenHeight,
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
                ),
              ),
            ),
            SizedBox(
              height: 32 * screenHeight,
            ),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.homeView);
              },
              screenWidth: screenWidth,
              title: 'Login',
              screenHeight: screenHeight,
            ),
            SizedBox(
              height: 12 * screenHeight,
            ),
            SkipButton(
              color: kPrimeColor,
              title: 'Forgor password',
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  context: context,
                  builder: (context) => const ForgotPassword(),
                );
              },
            ),
            SizedBox(
              height: 124 * screenHeight,
            ),
            SkipButton(
              color: kPrimeColor,
              title: 'Don’t have an account? Sign up',
              onTap: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
