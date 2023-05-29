import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'shared_manager.dart';

class ApplicationInit {
  Future<void> firstlyInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await _initEasyLocalization();
    SharedManager.instance.initSharedManager();
  }

  /// EasyLocalization Initialization
  Future _initEasyLocalization() async {
    EasyLocalization.logger.enableBuildModes = [];
    await EasyLocalization.ensureInitialized();
  }
}
