import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomBaseViewModel extends BaseViewModel {
  late final BuildContext context;

  void onViewModelReady(BuildContext context) {
    this.context = context;
  }
}
