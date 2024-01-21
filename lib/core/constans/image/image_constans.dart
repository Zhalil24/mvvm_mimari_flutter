class ImageConstans {
  static ImageConstans? _instace;
  static ImageConstans? get instance {
    if (_instace == null) _instace = ImageConstans._init();
    return _instace;
  }

  ImageConstans._init();

  String get hotDog => toPng("hotdogs");

  String toPng(String name) => "assets/image/$name.png";
}
