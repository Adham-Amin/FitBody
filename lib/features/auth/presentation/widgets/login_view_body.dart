import 'package:fitbody/constants.dart';
import 'package:fitbody/core/function/auth.dart';
import 'package:fitbody/core/utils/app_router.dart';
import 'package:fitbody/core/utils/styles.dart';
import 'package:fitbody/core/widgets/custom_button.dart';
import 'package:fitbody/core/widgets/skip_button.dart';
import 'package:fitbody/features/auth/presentation/widgets/forgot_password.dart';
import 'package:fitbody/features/auth/presentation/widgets/text_field_sign.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool obscureText = true;

  void submit() async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await authentication(
        isLogin: true,
        email: email!,
        pass: password!,
        ctx: context,
        gender: null,
        name: null,
        age: null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width / 375;
    final screenHeight = MediaQuery.of(context).size.height / 812;

    return Form(
      key: formKey,
      child: Padding(
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
                onSaved: (p0) => email = p0,
                keyboardType: TextInputType.emailAddress,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                hintText: 'Email',
              ),
              SizedBox(
                height: 12 * screenHeight,
              ),
              TextFieldSign(
                onSaved: (p0) => password = p0,
                keyboardType: TextInputType.visiblePassword,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                hintText: 'Password',
                obscureText: obscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              SizedBox(
                height: 32 * screenHeight,
              ),
              CustomButton(
                onTap: () {
                  submit();
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
                title: 'Don’t have an account? Join us',
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.regiterView);
                },
              ),
              SizedBox(height: 24 * screenHeight),
            ],
          ),
        ),
      ),
    );
  }
}
