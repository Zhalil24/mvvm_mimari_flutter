import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../../core/init/network/vexena_manager.dart';
import '../model/house_model.dart';
import '../services/BuildFeedService.dart';
import '../services/IBuildFeedService.dart';

part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  BuildContext? myContext;
  void setContext(BuildContext context) => this.myContext = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late IBuildService feedService;

  @observable
  List<HouseModel> houseModels = [];

  @observable
  List<String> likeItems = [];

  @action
  void onLikeItemPressed(String id) {
    if (likeItems.contains(id)) {
      likeItems.remove(id);
    } else {
      likeItems.add(id);
    }
    likeItems = likeItems;
  }

  @computed
  HouseModel get sliderHouse => houseModels.first;

  @observable
  bool isLoading = false;

  void init() {
    feedService = BuildService(VexanaManager.instance!.networkManager, scaffoldKey);
  }

  @action
  void _chaangeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getListAll() async {
    _chaangeLoading();
    houseModels = await feedService.fetchUserHouseList() ?? [];
    _chaangeLoading();
  }
}
