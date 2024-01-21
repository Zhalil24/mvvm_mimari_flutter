import 'package:vexana/vexana.dart';

import '../../../../_product/_utlilty/service_helper.dart';
import '../../../../_product/enum/network_route_enum.dart';
import '../model/house_model.dart';
import 'IBuildFeedService.dart';

class BuildService extends IBuildService with ServiceHelper {
  BuildService(super.manager, super.scaffoldKey);

  @override
  Future<List<HouseModel>?> fetchUserHouseList() async {
    final response =
        await manager.send<HouseModel, List<HouseModel>>(NetworkRoutes.BUILD_HOME.rawValue, parseModel: HouseModel(), method: RequestType.GET);

    return response.data;
  }
}
