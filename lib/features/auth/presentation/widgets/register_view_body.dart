import 'package:fitbody/constants.dart';
import 'package:fitbody/core/utils/app_router.dart';
import 'package:fitbody/core/utils/styles.dart';
import 'package:fitbody/core/widgets/custom_button.dart';
import 'package:fitbody/core/widgets/skip_button.dart';
import 'package:fitbody/features/auth/presentation/widgets/gender_select.dart';
import 'package:fitbody/features/auth/presentation/widgets/text_field_sign.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key, required this.onTap});

  final Function onTap;

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';

  void submitAuth() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      widget.onTap(email, password, name, context);
      GoRouter.of(context).push(AppRouter.loginView);
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
                'Join us to start searching',
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
                height: 24 * screenHeight,
              ),
              TextFieldSign(
                onSavevd: (p0) => name = p0!,
                keyboardType: TextInputType.name,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                hintText: 'Name',
              ),
              SizedBox(
                height: 12 * screenHeight,
              ),
              TextFieldSign(
                onSavevd: (p0) => email = p0!,
                keyboardType: TextInputType.emailAddress,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                hintText: 'Email',
              ),
              SizedBox(
                height: 12 * screenHeight,
              ),
              TextFieldSign(
                onSavevd: (p0) => password = p0!,
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
                height: 40 * screenHeight,
              ),
              CustomButton(
                onTap: () {
                  submitAuth();
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
              SizedBox(
                height: 46 * screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
