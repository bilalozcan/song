// ignore_for_file: unused_element

class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance {
    _instace ??= ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

  final lottieAssets = _Lottie();
  final svgAssets = _SVG();

  final String launcher = 'png/launcher'.toPNG;
  final String avatar = 'png/avatar'.toPNG;
}

class _Lottie {
}

class _SVG {
}

extension _ImageConstantsExtension on String {
  String get toPNG => 'assets/$this.png';
  String get toJPEG => 'assets/$this.jpeg';
  String get toJSON => 'assets/$this.json';
  String get toSVG => 'assets/$this.svg';
}
