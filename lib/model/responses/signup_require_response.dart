import 'package:app_demo/model/base_response.dart';
import 'package:app_demo/model/data/require_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_require_response.g.dart';

@JsonSerializable()
class RequireDataResponse extends BaseResponse {
 
  RequireD d;

  RequireDataResponse(this.d) : super(false, 0);

  factory RequireDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RequireDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequireDataResponseToJson(this);
}

@JsonSerializable()
class RequireD {
  List<RequireData> regions;

  RequireD(this.regions);

  factory RequireD.fromJson(Map<String, dynamic> json) =>
      _$RequireDFromJson(json);

  Map<String, dynamic> toJson() => _$RequireDToJson(this);
}
