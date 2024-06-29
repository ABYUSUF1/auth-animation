import 'package:auth_animation/consts.dart';
import 'package:auth_animation/pages/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_animated_container.dart';

class SignInPage extends StatelessWidget {
  final PageController pageController;
  const SignInPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
// Slide down the AnimatedContainer from top of screen
    return CustomAnimatedContainer(
      alignmentBegin: const Alignment(0, -2),
      delay: delay,
      child: SignInBody(pageController: pageController),
    );
  }
}
