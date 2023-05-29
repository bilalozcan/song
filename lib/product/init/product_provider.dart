import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigate/navigation_service.dart';
import 'theme_manager.dart';

class ProductProvider {
  final List<SingleChildWidget> items = [
    Provider(create: (context) => NavigationService()),
    ChangeNotifierProvider<ThemeManager>(create: (context) => ThemeManager(context)),
    // ChangeNotifierProvider(create: (context) => UserContext(context)),

    //Global Access Screens
  ];
}
