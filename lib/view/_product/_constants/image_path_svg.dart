class SVGImagePath {
  static SVGImagePath? _instace;
  static SVGImagePath? get instance {
    if (_instace == null) _instace = SVGImagePath._init();
    return _instace;
  }

  SVGImagePath._init();

  final autoMobilSVG = "autoMobil".toSVG;
  final experienceSVG = "experience".toSVG;
  final newYearSVG = "newYear".toSVG;
}

extension _SVGPATH on String {
  String get toSVG => "assets/svg/$this.svg";
}
