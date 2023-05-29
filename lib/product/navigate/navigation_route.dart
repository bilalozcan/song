import 'package:flutter/material.dart';
import 'navigation_enums.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (NavigationEnums.init.normalValue(args.name)) {
      case NavigationEnums.init:
        return _normalNavigate(const Placeholder());
      case NavigationEnums.base:
        return _normalNavigate(const Placeholder());

      default:
        throw Exception('$this not found');
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget, {RouteSettings? settings, bool isFullScreen = false}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings, fullscreenDialog: isFullScreen);
  }

  // ignore: unused_element
  // PageRoute _fadeRouteNavigate(Widget widget, {RouteSettings? settings}) {
  //   return FadeRoute(page: widget, settings: settings);
  // }
}
