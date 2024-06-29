import 'package:auth_animation/app_assets.dart';
import 'package:auth_animation/consts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// [Facebook - Google - Apple] Buttons
class CustomLogoButtons extends StatefulWidget {
  const CustomLogoButtons({super.key});

  @override
  State<CustomLogoButtons> createState() => _CustomLogoButtonsState();
}

class _CustomLogoButtonsState extends State<CustomLogoButtons>
    with TickerProviderStateMixin {
  late final AnimationController _facebookController;
  late final AnimationController _googleController;
  late final AnimationController _appleController;

  @override
  void initState() {
    super.initState();
    _facebookController = AnimationController(vsync: this, duration: duration);
    _googleController = AnimationController(vsync: this, duration: duration);
    _appleController = AnimationController(vsync: this, duration: duration);

    // Custom delays for each button animation
    Future.delayed(const Duration(milliseconds: 600), () {
      _facebookController.forward();
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      _googleController.forward();
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      _appleController.forward();
    });
  }

  @override
  void dispose() {
    _facebookController.dispose();
    _googleController.dispose();
    _appleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildCustomButton(
            size: size,
            lottie: Assets.facebookIcon,
            controller: _facebookController),
        _buildCustomButton(
            size: size,
            lottie: Assets.googleIcon,
            controller: _googleController),
        _buildCustomButton(
            size: size, lottie: Assets.appleIcon, controller: _appleController),
      ],
    );
  }

  Widget _buildCustomButton(
      {required Size size,
      required String lottie,
      required AnimationController controller}) {
    return Container(
      width: size.width / 5,
      height: size.width / 5,
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(size.height / 40),
      ),
      child: Center(
        child: SizedBox(
          width: size.width / 13,
          height: size.width / 13,
          child: Lottie.asset(
            lottie,
            controller: controller,
            repeat: false,
          ),
        ),
      ),
    );
  }
}
