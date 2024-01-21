import '../../init/network/IResponseModel.dart';

class BaseError extends IErrorModel {
  final String mesage;

  BaseError(this.mesage);
}
