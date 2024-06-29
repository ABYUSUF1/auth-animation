import 'package:auth_animation/consts.dart';
import 'package:auth_animation/pages/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_animated_container.dart';

class SignUpPage extends StatelessWidget {
  final PageController pageController;
  const SignUpPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
// Slide down the AnimatedContainer from top of screen
    return CustomAnimatedContainer(
      alignmentBegin: const Alignment(-2, 0),
      delay: delay,
      child: SignUpBody(pageController: pageController),
    );
  }
}
