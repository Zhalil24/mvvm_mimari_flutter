enum NetworkRoutes { LOGIN, BUILD_HOME }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "auth/login";
      case NetworkRoutes.BUILD_HOME:
        return "house";
      default:
        throw Exception("Routes Not Found");
    }
  }
}
