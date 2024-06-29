import 'package:auth_animation/app_assets.dart';
import 'package:auth_animation/consts.dart';
import 'package:auth_animation/pages/widgets/custom_logo_buttons.dart';
import 'package:auth_animation/pages/widgets/custom_or_line.dart';
import 'package:auth_animation/pages/widgets/custom_text_field.dart';
import 'package:auth_animation/pages/widgets/fade_animation.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatefulWidget {
  final PageController pageController;
  const SignInBody({super.key, required this.pageController});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Widget> widgets = [
      Image.asset(
        Assets.logo,
        width: size.height / 20,
      ),
      SizedBox(height: size.height / 65),
      Text(
        'Welcome',
        style:
            TextStyle(fontSize: size.height / 55, fontWeight: FontWeight.bold),
      ),
      Text(
        'Please enter your details to sign in',
        style: TextStyle(
          fontSize: size.height / 60,
          color: Colors.grey[300]!,
        ),
      ),
      SizedBox(height: size.height / 30), // Space between Texts and Buttons
      const CustomLogoButtons(),
      SizedBox(height: size.height / 22),
      const CustomOrLine(),
      SizedBox(height: size.height / 22),
      CustomTextFormField(
          controller: emailController,
          fieldName: 'E-Mail Address',
          icon: Icons.email,
          hintText: 'Enter Your Email'),
      SizedBox(height: size.height / 40),
      CustomTextFormField(
          controller: passwordController,
          fieldName: 'PassWord',
          icon: Icons.remove_red_eye,
          hintText: 'Enter Your Password'),
      SizedBox(height: size.height / 30),
      _buildSignInButton(size: size),
      const Spacer(),
      _buildSignUpButton(size: size),
    ];

    return Column(
      children: List.generate(widgets.length, (index) {
        // don't Apply fadeSlide animation with SizedBox and Spacer
        if (widgets[index] is SizedBox || widgets[index] is Spacer) {
          return widgets[index];
        } else {
          return SlideFadeAnimation(
            delay: Duration(milliseconds: 20 * index),
            child: widgets[index],
          );
        }
      }),
    );
  }

// Sign_in button and Forget Password button
  Row _buildSignInButton({required Size size}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {},
            child: Container(
                width: size.height / 5,
                height: size.height / 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(size.height / 70),
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: size.height / 80, color: Colors.white),
                  ),
                ))),
        TextButton(
          onPressed: () {},
          child: Text('Forget Password ?',
              style: TextStyle(fontSize: size.height / 80, color: Colors.blue)),
        ),
      ],
    );
  }

// Navigate to SignUp Page
  GestureDetector _buildSignUpButton({required Size size}) {
    return GestureDetector(
      onTap: () {
        widget.pageController.nextPage(duration: duration, curve: easeCurve);
      },
      child: Text.rich(
        TextSpan(
          text: 'Don\'t have an account ?   ',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: size.height / 80),
          children: const [
            TextSpan(
              text: 'Sign up',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
