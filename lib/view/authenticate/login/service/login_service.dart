import 'package:vexana/vexana.dart';

import '../../../_product/enum/network_route_enum.dart';
import '../model/login_model.dart';
import '../model/login_model_response.dart';
import 'ILogin_service.dart';

class LoginService extends ILoginService {
  LoginService(super.manager);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(NetworkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(), method: RequestType.POST, data: model);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
