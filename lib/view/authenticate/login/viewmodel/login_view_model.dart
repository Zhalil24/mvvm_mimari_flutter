import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constans/enums/locale_keys_enum.dart';
import '../../../../core/init/network/vexena_manager.dart';
import '../model/login_model.dart';
import '../service/ILogin_service.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  BuildContext? myContext;
  void setContext(BuildContext context) {
    this.myContext = context;
  }

  void init() {
    loginService = LoginService(VexanaManager.instance!.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  Future<void> fetchLoginService() async {
    isLockOverChage();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(LoginModel(username: emailController.text, password: passwordController.text));

      if (response != null) {
        ScaffoldMessenger.of(myContext!).showSnackBar(SnackBar(content: Text(response.token!)));

        localeManager.setStringValue(PreferencesKeys.TOKEN, response.token!);
      }
    }
    isLoadingChage();
  }

  @action
  void isLockOverChage() {
    isLockOpen = !isLockOpen;
  }

  @action
  void isLoadingChage() {
    isLoading = !isLoading;
  }
}
