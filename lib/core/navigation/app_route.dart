import 'package:flutter/material.dart';
import 'package:signeducation/core/resources/enums.dart';
import 'package:signeducation/features/categories/view/pages/categories_view.dart';
import 'package:signeducation/features/lesson/models/lesson_model.dart';
import 'package:signeducation/features/lesson/view/pages/lesson_view.dart';
import 'package:signeducation/features/levels/view/pages/levels_view.dart';

import '../../features/main/view/pages/main_view.dart';
import '../../features/splash/view/pages/splash_view.dart';
import 'route_path.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Core
      case RoutePath.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case RoutePath.main:
        return
            // CustomPageRoute(const LoginView());
            MaterialPageRoute(builder: (_) => const MainView());
      case RoutePath.levels:
        return
            // CustomPageRoute(const LoginView());
            MaterialPageRoute(builder: (_) => const LevelsView());
      case RoutePath.categories:
        List<Categories> argument = settings.arguments as List<Categories>;
        return
            // CustomPageRoute(const LoginView());
            MaterialPageRoute(
                builder: (_) => CategoriesView(
                      categories: argument,
                    ));
      case RoutePath.lesson:
        List<LessonModel> argument = settings.arguments as List<LessonModel>;
        return
            // CustomPageRoute(const LoginView());
            MaterialPageRoute(
                builder: (_) => LessonView(
                      lessons: argument,
                    ));

      default:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
          // settings: settings,
        );
    }
    // CustomPageRoute(const LoginView());
  }
}

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    const begin = 1.0;
    const end = 0.0;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return FadeTransition(
      opacity: animation.drive(tween),
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 10);
}