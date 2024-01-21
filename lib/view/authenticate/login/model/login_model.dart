import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends INetworkModel<LoginModel> {
  final String? username;
  final String? password;

  LoginModel({this.username, this.password});
  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginModelToJson(this);
  }
}
