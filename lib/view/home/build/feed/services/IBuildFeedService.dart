import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/house_model.dart';

abstract class IBuildService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IBuildService(this.manager, this.scaffoldKey);

  Future<List<HouseModel>?> fetchUserHouseList();
}
