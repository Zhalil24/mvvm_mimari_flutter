import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager? get instance {
    if (_instace == null) _instace = VexanaManager._init();
    return _instace;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager<Null>(
      isEnableLogger: true,
      options: BaseOptions(
          baseUrl:
              "https://50d93afe-1b9b-4fe6-9098-7cffe79e296f.mock.pstmn.io/"));
}
