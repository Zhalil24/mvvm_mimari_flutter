import '../constans/app/enums/http_request_enum.dart';

extension NetworkTypesExtension on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return "GET";
      case HttpTypes.POST:
        return "POST";

      default:
        throw "ERROR TYPE";
    }
  }
}
