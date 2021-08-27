import 'package:flutter/material.dart';

getAnimatedPageSwitcher({Widget child}) {
  return AnimatedSwitcher(
    duration: Duration(milliseconds: 500),
    switchInCurve: Curves.ease,
    switchOutCurve: Curves.ease,
    transitionBuilder: (child, animation) {
      final offsetAnimation = Tween<Offset>(
        begin: Offset(-1.0, 0.0),
        end: Offset(0.0, 0.0),
      ).animate(animation);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    layoutBuilder: (currentChild, previousChildren) => currentChild,
    child: child,
  );
}
