// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return Employee(
      json['id'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['mobileNumber'] as String,
      json['email'] as String,
      json['gender'] as String,
      json['eeGroup'] as String,
      json['subgroup'] as String,
      json['subarea'] as String,
      json['discipline'] as String,
      json['createdDate'],
      json['lastModifiedBy'] as String,
      json['lastModifiedDate'],
      json['isActive'] as bool,
      json['isDeleted'] as bool,
      json['dateOfRetirement'] as int);
}

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'gender': instance.gender,
      'eeGroup': instance.eeGroup,
      'subgroup': instance.subgroup,
      'subarea': instance.subarea,
      'discipline': instance.discipline,
      'createdDate': instance.createdDate,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedDate': instance.lastModifiedDate,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'dateOfRetirement': instance.dateOfRetirement
    };
