import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product/constants/product_constants.dart';
import 'product/extension/init_widget_extension.dart';
import 'product/init/application_init.dart';
import 'product/init/theme_manager.dart';
import 'product/navigate/navigation_route.dart';
import 'product/navigate/navigation_service.dart';

void main() async {
  final appInit = ApplicationInit();
  await appInit.firstlyInit();
  runApp(const MyApp().easyLocalization.multiProvider);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProductConstants.instance.appName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: context.read<ThemeManager>().currentTheme,
      navigatorKey: context.read<NavigationService>().navigatorKey,
      onGenerateRoute: NavigationRoute().generateRoute,
    );
  }
}
