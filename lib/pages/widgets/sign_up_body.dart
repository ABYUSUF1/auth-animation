import 'package:auth_animation/consts.dart';
import 'package:auth_animation/pages/widgets/custom_logo_buttons.dart';
import 'package:auth_animation/pages/widgets/custom_or_line.dart';
import 'package:auth_animation/pages/widgets/custom_text_field.dart';
import 'package:auth_animation/pages/widgets/fade_animation.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  final PageController pageController;
  const SignUpBody({super.key, required this.pageController});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController createPasswordController =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    createPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Widget> widgets = [
      Padding(
        padding: EdgeInsets.only(top: size.height / 80, left: size.height / 80),
        child: Text('Create New Account',
            style: TextStyle(fontSize: size.height / 45)),
      ),
      Text('Please enter your details to sign up',
          style:
              TextStyle(fontSize: size.height / 60, color: Colors.grey[300]!)),
      SizedBox(height: size.height / 30), // Space between Texts and Buttons
      CustomTextFormField(
          controller: emailController,
          fieldName: 'E-Mail Address',
          icon: Icons.email,
          hintText: 'Enter Your Email'),
      SizedBox(height: size.height / 40),
      CustomTextFormField(
          controller: createPasswordController,
          fieldName: 'Create New PassWord',
          icon: Icons.remove_red_eye,
          hintText: 'Create Password'),
      SizedBox(height: size.height / 40),
      CustomTextFormField(
          controller: createPasswordController,
          fieldName: 'Confirm PassWord',
          icon: Icons.remove_red_eye,
          hintText: 'Repeat Password Again'),
      SizedBox(height: size.height / 22),
      const CustomOrLine(),
      SizedBox(height: size.height / 22),
      const CustomLogoButtons(),
      const Spacer(),
      _buildSignInButton(size: size),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        GestureDetector(
          onTap: () {
            widget.pageController
                .previousPage(duration: duration, curve: easeCurve);
          },
          child: Column(
            children: [
              Text('Already Have Account ?',
                  style: TextStyle(fontSize: size.height / 80)),
              Text('Sign in',
                  style: TextStyle(
                      fontSize: size.height / 80, color: Colors.blue)),
            ],
          ),
        ),
      ],
    );
  }
}
