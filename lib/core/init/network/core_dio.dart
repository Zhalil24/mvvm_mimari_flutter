import 'dart:io';

import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constans/app/enums/http_request_enum.dart';
import '../../extension/network_extension.dart';
import 'ICoreDio.dart';
import 'IResponseModel.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
  }

  Future<ResponseModel<R>> fetch1<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required parseModel,
    dynamic data,
    Map<String, dynamic>? querParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await request(path, data: data, options: Options(method: type.rawValue));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final model = _responseParser(parseModel, response.data);
        return ResponseModel<R>(data: model);

      default:
        return ResponseModel<R>(error: BaseError("message"));
    }
  }

  R _responseParser<R>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList() as R;
    } else if (data is Map) {
      model.fromJson(data.map((key, value) => MapEntry(key.toString(), value))) as R;
    }
    return data as R;
  }
}
