// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPResponse _$OTPResponseFromJson(Map<String, dynamic> json) {
  return OTPResponse(json['d'] == null
      ? null
      : EmployeeS.fromJson(json['d'] as Map<String, dynamic>))
    ..s = json['s'] as bool
    ..e = json['e'] as int;
}

Map<String, dynamic> _$OTPResponseToJson(OTPResponse instance) =>
    <String, dynamic>{'s': instance.s, 'e': instance.e, 'd': instance.d};

EmployeeS _$EmployeeSFromJson(Map<String, dynamic> json) {
  return EmployeeS(
      json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
      json['status'] as int);
}

Map<String, dynamic> _$EmployeeSToJson(EmployeeS instance) =>
    <String, dynamic>{'employee': instance.employee, 'status': instance.status};
