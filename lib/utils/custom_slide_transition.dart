import 'package:flutter/material.dart';

class CustomDiagonalSlideTransition extends PageRouteBuilder {
  final Widget child;
  CustomDiagonalSlideTransition({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final animationTween = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(
              position: animationTween,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
}
