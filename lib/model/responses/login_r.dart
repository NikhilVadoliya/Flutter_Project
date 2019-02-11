import 'package:app_demo/model/base_response.dart';
import 'package:app_demo/model/responses/login_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_r.g.dart';

@JsonSerializable()
class LoginR extends BaseResponse {
  LoginResponse d;

  LoginR(bool s, int e) : super(s, e);


  factory LoginR.fromJson(Map<String, dynamic> json) =>
      _$LoginRFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRToJson(this);
}
