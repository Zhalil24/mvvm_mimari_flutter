import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constans/enums/locale_keys_enum.dart';
import '../../../../core/constans/navigation/navigation_contans.dart';
import '../../../_product/_constants/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewMoodel = _OnBoardViewMoodelBase with _$OnBoardViewMoodel;

abstract class _OnBoardViewMoodelBase with Store, BaseViewModel {
  late BuildContext myContext;
  void setContext(BuildContext context) => this.myContext = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  void init() {
    onBoardItems.add(OnBoardModel("Make It Good", "You are not alone. You have unique abiltyto another world", SVGImagePath.instance!.autoMobilSVG));
    onBoardItems.add(OnBoardModel("Make It Good", "You are not alone. You have unique abiltyto another world", SVGImagePath.instance!.experienceSVG));
    onBoardItems.add(OnBoardModel("Make It Good", "You are not alone. You have unique abiltyto another world", SVGImagePath.instance!.newYearSVG));
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> complateToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    navigation?.navigateToPage(path: NavigationConstants.TEST_VIEW);
  }
}
