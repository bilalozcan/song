import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../init/language_manager.dart';
import '../init/product_provider.dart';
import '../navigate/navigation_service.dart';

extension WidgetExtension on Widget {
  Widget get easyLocalization {
    LanguageManager languageManager = LanguageManager.instance;
    return EasyLocalization(
      supportedLocales: languageManager.supportLocales,
      path: languageManager.assetPath,
      fallbackLocale: languageManager.trLocale,
      child: this,
    );
  }

  Widget get multiProvider => MultiProvider(providers: ProductProvider().items, child: this);
}

extension NavigationExtension on BuildContext {
  NavigationService get navigation => read<NavigationService>();
}
