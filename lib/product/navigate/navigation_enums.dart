enum NavigationEnums {
  init,
  login,
  base,
}

extension NavigationConstantsValue on NavigationEnums {
  String get rawValue {
    switch (this) {
      case NavigationEnums.init:
        return '/init';
      case NavigationEnums.login:
        return '/login';
      case NavigationEnums.base:
        return '/base';
    }
  }

  NavigationEnums normalValue(String? val) {
    switch (val) {
      case '/':
      case '/init':
        return NavigationEnums.init;
      case '/login':
        return NavigationEnums.login;
      case '/base':
        return NavigationEnums.base;
      default:
        throw Exception('$val not found in $this');
    }
  }
}
