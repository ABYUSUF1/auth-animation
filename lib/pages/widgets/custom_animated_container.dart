import 'package:auth_animation/consts.dart';
import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
// AnimatedContainer's child
  final Widget child;

// AlignmentTransition start
  final AlignmentGeometry alignmentBegin;

// Delay Animation [if wanted]
  final Duration delay;
  const CustomAnimatedContainer(
      {super.key,
      required this.child,
      required this.alignmentBegin,
      required this.delay});

  @override
  State<CustomAnimatedContainer> createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late final Animation<AlignmentGeometry> alignAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: duration);

    alignAnimation = Tween<AlignmentGeometry>(
            begin: widget.alignmentBegin, end: Alignment.center)
        .animate(
            CurvedAnimation(parent: animationController, curve: easeCurve));

    Future.delayed(widget.delay, () {
      animationController.forward();
    });

    animationController.addListener(() {
      if (animationController.isCompleted) {
        // When animation complete rebuild to show container child
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  bool isResizeAnimationComplete = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: AlignTransition(
        alignment: alignAnimation,
        child: AnimatedContainer(
          duration: duration,
          curve: easeCurve,
          onEnd: () {
            setState(() {
              isResizeAnimationComplete = true;
            });
          },
          width: animationController.isCompleted
              ? _calculateResponsiveWidth(width: size.width)
              : size.height / 15,
          height: animationController.isCompleted
              ? _calculateResponsiveHeight(height: size.height)
              : size.height / 15,
          padding: EdgeInsets.all(size.width / 50),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size.height / 20)),
          child: isResizeAnimationComplete
              ? FittedBox(
                  child: SizedBox(
                    width: _calculateResponsiveWidth(width: size.width),
                    height: _calculateResponsiveHeight(height: size.height),
                    child: widget.child,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  double _calculateResponsiveWidth({required double width}) {
// for tablets
    if (width >= 1080) {
      return width / 1.3;
    }
// any device else
    else {
      return width / 1.2;
    }
  }

  double _calculateResponsiveHeight({required double height}) {
// For big screens
    if (height > 960) {
      return height / 1.33;
    }
// For big medium screens
    else if (height >= 800) {
      return height / 1.36;
    }
// For medium screens
    else if (height > 667) {
      return height / 1.3;
    }
// For small screens
    else {
      return height / 1.25;
    }
  }
}
