class ProductConstants {
  static ProductConstants? _instace;
  static ProductConstants get instance {
    _instace ??= ProductConstants._init();
    return _instace!;
  }

  ProductConstants._init();

  final String appName = 'Song';
  final String appNameTitle = 'Song App';

}
