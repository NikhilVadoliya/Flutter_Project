import 'package:app_demo/model/base_response.dart';
import 'package:app_demo/model/data/employee_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OTPResponse extends BaseResponse {

  EmployeeS d;

  OTPResponse(this.d) : super(false, 0);

  factory OTPResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OTPResponseToJson(this);
}

@JsonSerializable()
class EmployeeS {
  Employee employee;
  int status;

  EmployeeS(this.employee, this.status);

  factory EmployeeS.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeSToJson(this);
}
