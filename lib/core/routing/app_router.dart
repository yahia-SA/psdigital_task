import 'package:flutter/material.dart';

class AppRouter {


  PageRouteBuilder createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration:  const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final offsetAnimation = Tween<Offset>(
            begin: const Offset(0, 1), 
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut, 
          ));

        return  SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
