import 'package:dio/dio.dart';

import '../../constans/enums/locale_keys_enum.dart';
import '../cache/local_manager.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance!;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions =
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/", headers: {"val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)});

    coreDio = CoreDio(baseOptions);

    /* _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.path += "veli";
      },
      onResponse: (e, handler) {
        return e.data;
      },
      onError: (e, handler) {
        print(e.message ?? 'Bir hata oluştu.');
      },
    ) );*/
  }
}
