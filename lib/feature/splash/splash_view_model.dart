import 'package:flutter/material.dart';
import 'package:song/product/extension/init_widget_extension.dart';

import '../../product/base/custom_base_view_model.dart';
import '../../product/navigate/navigation_enums.dart';

class SplashViewModel extends CustomBaseViewModel {

  @override
  void onViewModelReady(BuildContext context) async {
    super.onViewModelReady(context);
    await Future.delayed(const Duration(seconds: 1)).then((value) async {
      context.navigation.navigateToPageClear(path: NavigationEnums.home.rawValue);
    });
  }
}
