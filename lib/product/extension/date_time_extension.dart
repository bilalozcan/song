import 'package:date_format/date_format.dart';

extension FormatDateTimeExtension on DateTime {
  String get onlyDate {
    return formatDate(this, [dd, '/', mm, '/', yyyy]);
  }
  String get ddMM {
    return formatDate(this, [dd, '.', mm]);
  }
  String get all {
    return formatDate(this, [dd, '-', mm, '-', yyyy, ' ', hh, ':', mm]);
  }
}