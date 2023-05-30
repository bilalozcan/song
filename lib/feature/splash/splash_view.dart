import 'package:flutter/material.dart';
import 'package:song/core/extension/context_extension.dart';
import 'package:stacked/stacked.dart';

import '../../core/constants/layout_constants.dart';
import '../../product/constants/image_constants.dart';
import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override  
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: builder,
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(context),
    );
  }

  Scaffold builder(BuildContext context, SplashViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor:  context.themeData.cardTheme.color,
      body: Padding(
        padding: LayoutConstants.maxAllPadding,
        child: Center(child: Image.asset(ImageConstants.instance.launcher)),
      ),
    );
  }
}