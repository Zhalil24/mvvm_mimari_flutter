import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/constans/app/enums/app_theme_enum.dart';
import '../../../../core/constans/app/enums/http_request_enum.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  late BuildContext myContext;
  void setContext(BuildContext context) {
    this.myContext = context;
  }

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(myContext, listen: false).changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    final response = await NetworkManager.instance.coreDio?.fetch1<List<TestModel>, TestModel>("x", type: HttpTypes.GET, parseModel: TestModel());

    if (response?.data is List<TestModel>) {
    } else {}
    isLoading = false;
  }
}
