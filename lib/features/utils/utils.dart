import 'package:flutter/material.dart';

class CustomSlideTransition extends PageRouteBuilder {
  final Widget child;
  CustomSlideTransition({required this.child})
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
          transitionDuration: const Duration(milliseconds: 300),
        );
}

//
String truncateWithEllipsis(String text, int maxWords) {
  final words = text.split(' ');
  if (words.length <= maxWords) return text;
  return '${words.sublist(0, maxWords).join(' ')}...';
}
