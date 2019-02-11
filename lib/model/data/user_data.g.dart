// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

USerData _$USerDataFromJson(Map<String, dynamic> json) {
  return USerData(
      json['id'] as String,
      json['name'] as String,
      json['mobileNumber'] as String,
      json['email'] as String,
      json['status'] as int,
      json['verifiedOn'],
      json['approvedBy'],
      json['createdBy'] as String,
      json['createdDate'],
      json['isActive'] as bool);
}

Map<String, dynamic> _$USerDataToJson(USerData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'status': instance.status,
      'verifiedOn': instance.verifiedOn,
      'approvedBy': instance.approvedBy,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'isActive': instance.isActive
    };
