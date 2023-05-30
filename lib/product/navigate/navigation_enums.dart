enum NavigationEnums { init, home, songDetail }

extension NavigationConstantsValue on NavigationEnums {
  String get rawValue {
    switch (this) {
      case NavigationEnums.init:
        return '/init';
      case NavigationEnums.home:
        return '/home';
      case NavigationEnums.songDetail:
        return '/songDetail';
    }
  }

  NavigationEnums normalValue(String? val) {
    switch (val) {
      case '/':
      case '/init':
        return NavigationEnums.init;
      case '/home':
        return NavigationEnums.home;
      case '/songDetail':
        return NavigationEnums.songDetail;
      default:
        throw Exception('$val not found in $this');
    }
  }
}
