import 'package:flutter/material.dart';
import 'package:song/feature/song_detail/song_detail_view.dart';

import '../models/song/song.dart';
import '/feature/home/home_view.dart';
import '/feature/splash/splash_view.dart';
import 'navigation_enums.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (NavigationEnums.init.normalValue(args.name)) {
      case NavigationEnums.init:
        return _normalNavigate(const SplashView());
      case NavigationEnums.home:
        return _normalNavigate(const HomeView());
      case NavigationEnums.songDetail:
        return _normalNavigate(SongDetailView(song: args.arguments as Song));

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
