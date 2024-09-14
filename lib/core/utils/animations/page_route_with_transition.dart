import 'package:flutter/material.dart';

// class PageRouteWithTransition extends PageRouteBuilder {
//   final Widget page;
//   final Widget route;

//   PageRouteWithTransition({required this.page, required this.route})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               page,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               ScaleTransition(
//             scale: animation,
//             child: FadeTransition(
//               opacity: animation,
//               child: child,
//             ),
//           ),
//         );
// }

class PageRouteWithTransition extends PageRoute {
  final Widget page;

  PageRouteWithTransition({required this.page}) : super(settings: RouteSettings(name: page.runtimeType.toString()));

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return page;
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
