import '../../base/model/base_model.dart';
import '../../constans/app/enums/http_request_enum.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<ResponseModel<R>> fetch1<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required parseModel,
    dynamic data,
    Map<String, dynamic>? querParameters,
    void Function(int, int)? onReceiveProgress,
  });
}
